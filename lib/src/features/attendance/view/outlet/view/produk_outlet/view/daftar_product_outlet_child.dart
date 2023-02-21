import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/detail_produk_outlet_view.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/search_produk_outlet.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/widget/barang_kosong.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class DaftarProductOutletChild extends StatefulWidget {
  final int id_outlet;
  final ProductOutletPaging? dataOrigin;
  final bool emptyData;
  const DaftarProductOutletChild(this.id_outlet,
      {this.emptyData = false, this.dataOrigin, super.key});

  @override
  State<DaftarProductOutletChild> createState() =>
      _DaftarProductOutletChildState();
}

class _DaftarProductOutletChildState extends State<DaftarProductOutletChild> {
  ValueNotifier<List<ProductOutlet>> databox = ValueNotifier([]);
  late List<ProductOutlet> originalData = widget.dataOrigin!.data!;
  bool loading = true;
  bool emptyData = false;
  int modeFilter = 0;
  bool init = true;

  @override
  void initState() {
    setState(() {
      List<ProductOutlet> copyBox = List.of(originalData);
      copyBox.sort((b, a) => b.product!.name
          .toString()
          .toLowerCase()
          .compareTo(a.product!.name.toString().toLowerCase()));
      databox.value = copyBox;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() =>
          BlocProvider.of<ProductOutletBloc>(context)
              .add(ProductOutletEvent.getProduct(outletId: widget.id_outlet))),
      child: Column(
        children: [
          headerForm(),
          filterView(),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ValueListenableBuilder<List<ProductOutlet>>(
              valueListenable: databox,
              builder: (context, value, child) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) => value.isEmpty
                    ? barangKosong(context)
                    : produkCard(context, index, value[index]),
              ),
            ),
          )),
        ],
      ),
    );
  }

  //ANCHOR - Filtered Item from User Input
  void filterSearchResults(String query) {
    List<ProductOutlet> dummySearchList = [];
    dummySearchList.addAll(originalData);
    if (query.isNotEmpty) {
      List<ProductOutlet> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.product!.name!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        databox.value.clear();
        databox.value.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        List<ProductOutlet> copyBox = List.of(originalData);
        databox.value.clear();
        copyBox.sort((b, a) => b.product!.name
            .toString()
            .toLowerCase()
            .compareTo(a.product!.name.toString().toLowerCase()));
        databox.value.addAll(copyBox);
      });
    }
  }

  //ANCHOR - Filtered Default by Name and Switched to Highest Price
  void filter() {
    List<ProductOutlet> copyBox = List.of(originalData);
    if (modeFilter == 1) {
      copyBox.sort((b, a) => a.product!.price
          .toString()
          .toLowerCase()
          .compareTo(b.product!.price.toString().toLowerCase()));
      setState(() {
        databox.value = copyBox;
      });
    } else if (modeFilter == 2) {
      copyBox.sort((b, a) => a.product!.omset
          .toString()
          .toLowerCase()
          .compareTo(b.product!.omset.toString().toLowerCase()));
      setState(() {
        databox.value = copyBox;
      });
    } else {
      copyBox.sort((b, a) => b.product!.name
          .toString()
          .toLowerCase()
          .compareTo(a.product!.name.toString().toLowerCase()));
      setState(() {
        databox.value = copyBox;
      });
    }
  }

  //ANCHOR - Get Total Price
  totalPrice() {
    double sum = originalData.fold(
        0, (sum, element) => sum.toDouble() + element.product!.price!);
    return sum;
  }

  //ANCHOR - Get Total Omset
  totalOmset() {
    double sum = originalData.fold(
        0, (sum, element) => sum.toDouble() + element.product!.omset!);
    return sum;
  }

  //ANCHOR - Header to Show Total Product, Total Price, Total Omzet
  Widget headerForm() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      color: Colors.grey[100],
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              color: XAppColors.primaryColors,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 8),
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 18,
                      )),
                  const Expanded(
                    child: Text(
                      'Produk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (con) => const SearchProdukOutlet())
                            .then((value) {
                          if (value != null) {
                            if (value == true) {
                            } else {
                              filterSearchResults(value);
                            }
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          Positioned(
              top: 90,
              right: 0,
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text("Total Produk",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: XAppColors.grey,
                                  )),
                              Text(
                                "${originalData.length}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text("Total Harga",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: XAppColors.grey,
                                  )),
                              Text(
                                config()
                                    .format_rupiah(totalPrice().toString())!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text("Total Omset",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: XAppColors.grey,
                                  )),
                              Text(
                                config()
                                    .format_rupiah(totalOmset().toString())!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  //ANCHOR - Show Optional Filter
  Widget filterView() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                modeFilter = 0;
                filter();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: (modeFilter == 0) ? XAppColors.green : Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Semua",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: (modeFilter == 0) ? Colors.white : XAppColors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                modeFilter = 1;
                filter();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: (modeFilter == 1) ? XAppColors.green : Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Harga Tertinggi",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: (modeFilter == 1) ? Colors.white : XAppColors.grey,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                modeFilter = 2;
                filter();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: (modeFilter == 2) ? XAppColors.green : Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Omset Tertinggi",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: (modeFilter == 2) ? Colors.white : XAppColors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //ANCHOR - Product Card
  Widget produkCard(BuildContext context, int index, ProductOutlet item) {
    return InkWell(
        onTap: () {
          //ANCHOR - Go to Product Outlet Detail Page
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (con) => DetailProdukOutletView(widget.id_outlet, item,
                  assignProductId: item.id.toString())).then((value) {
            if (value != null && value) {
              BlocProvider.of<ProductOutletBloc>(context).add(
                  ProductOutletEvent.getProduct(outletId: widget.id_outlet));
            }
          });
        },
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: XCacheNetworkImage(
                      imageUrl: item.product!.image ?? "",
                      size: const Size(42, 43),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          config()
                              .format_rupiah(item.product!.price.toString())!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: XAppColors.grey,
                          ),
                        ),
                        Text(
                          item.product!.name ?? "-",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Omset : ${config().format_rupiah(item.product!.omset.toString())}",
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
                    )
                        .format(DateTime.parse(item.product!.updatedAt!))
                        .toString(),
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
        ));
  }
}
