import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/search_produk_outlet.dart';
import 'package:absensi_app/src/network/model/outlet/master_product.dart';
import 'package:absensi_app/src/network/model/user/user.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class TambahProdukOutletBody extends StatefulWidget {
  final int idoutlet;
  final User user;
  final String querySearch;

  const TambahProdukOutletBody(this.idoutlet, this.user,
      {this.querySearch = "", super.key});

  @override
  State<TambahProdukOutletBody> createState() => _TambahProdukOutletBodyState();
}

class _TambahProdukOutletBodyState extends State<TambahProdukOutletBody> {
  final PagingController<int, MasterProduct> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 3);
  List<bool>? selectedList = [];
  bool loading = true;
  bool proses = false;
  String searchquery = "";

  void fetchPage() async {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<ProductOutletBloc>().add(ProductOutletEvent.getMasterProduct(
          pageNumber: pageKey, search: searchquery));
    });
  }

  void refresh() {
    _pagingController.refresh();
  }

  @override
  initState() {
    super.initState();
    fetchPage();
  }

  @override
  Widget build(BuildContext context) {
    Logger().e(searchquery);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ceklis Produk',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 18,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (con) => const SearchProdukOutlet()).then((value) {
                  if (value != null) {
                    if (value == true) {
                    } else {
                      setState(() {
                        searchquery = value;
                        _pagingController.refresh();
                      });
                    }
                  }
                });
              },
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.white,
              )),
        ],
        backgroundColor: XAppColors.primaryColors,
      ),
      //NOTE - Selected Master Product
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocConsumer<ProductOutletBloc, ProductOutletState>(
          listener: (context, state) {
            // state.
          },
          builder: (context, state) {
            return XButton(
              onPressed: () async {
                setState(() {
                  proses = true;
                });
                List<int> send = [];
                for (int i = 0; i < selectedList!.length; i++) {
                  if (selectedList![i]) {
                    send.add(_pagingController.itemList![i].id!);
                  }
                }
                if (send.isEmpty) {
                  XToast.show("Tidak ada produk yang ditambahkan");
                  proses = false;
                  Navigator.pop(context, false);
                } else {
                  Map<String, dynamic> params = {
                    "user_id": widget.user.id,
                    "outlet_id": widget.idoutlet,
                    "product_id": send.join(",")
                  };
                  context
                      .read<ProductOutletBloc>()
                      .add(ProductOutletEvent.addProduct(params: params));
                  proses = false;
                  Navigator.pop(context, true);
                }
              },
              title: "Simpan Produk",
              width: MediaQuery.of(context).size.width,
              backgroundColor: XAppColors.primaryColors,
              withHorizontalPadding: true,
              busy: proses,
              enabled: !proses,
            );
          },
        ),
      ),
      body: BlocListener<ProductOutletBloc, ProductOutletState>(
        listener: (context, state) {
          state.whenOrNull(
              isLoading: () => loading = true,
              productMaster: (data) {
                final isLastPage = data.nextPage == 0;
                if (isLastPage) {
                  for (int i = 0; i < data.data!.length; i++) {
                    setState(() {
                      selectedList!.add(false);
                    });
                  }
                  _pagingController.appendLastPage(data.data!);
                } else {
                  final nextPageKey = data.currentPage! + 1;
                  for (int i = 0; i < data.data!.length; i++) {
                    setState(() {
                      selectedList!.add(false);
                    });
                  }
                  _pagingController.appendPage(data.data!, nextPageKey);
                }
              },
              isError: (error) {
                _pagingController.error = error;
              });
        },
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: RefreshIndicator(
              onRefresh: () => Future.sync(() => _pagingController.refresh()),
              child: PagedListView<int, MasterProduct>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<MasterProduct>(
                    itemBuilder: (context, item, index) =>
                        produkCard(index, item)),
              ),
            )),
      ),
    );
  }

  Widget produkCard(int index, MasterProduct item) {
    // Map produk = data_produkList![index];
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                  value: selectedList![index],
                  activeColor: XAppColors.primaryColors,
                  onChanged: (newValue) {
                    setState(() {
                      selectedList![index] = newValue!;
                    });
                  }),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: XCacheNetworkImage(
                  imageUrl: item.image ?? "",
                  size: const Size(42, 43),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      config().format_rupiah(item.price.toString())!,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: XAppColors.grey,
                      ),
                    ),
                    Text(
                      item.name ?? "-",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      item.codeProduct ?? "",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: XAppColors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                DateFormat.yMMMEd(
                  "ID",
                ).format(DateTime.parse(item.updatedAt.toString())).toString(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.grey,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
            height: 0.5,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
