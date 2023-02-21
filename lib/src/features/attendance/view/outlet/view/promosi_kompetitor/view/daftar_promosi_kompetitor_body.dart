import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/bloc/promo_competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/detail_promosi_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/search_promosi_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/tambah_promosi_kompetitor.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_promo.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaftarPromosiKompetitorBody extends StatefulWidget {
  final int id_outlet;
  final List<KompetitorPromo> dataOrigin;

  const DaftarPromosiKompetitorBody(this.id_outlet, this.dataOrigin,
      {super.key});

  @override
  State<DaftarPromosiKompetitorBody> createState() =>
      _DaftarPromosiKompetitorBodyState();
}

class _DaftarPromosiKompetitorBodyState
    extends State<DaftarPromosiKompetitorBody> {
  ValueNotifier<List<KompetitorPromo>> databox = ValueNotifier([]);
  late List<KompetitorPromo> originalData = widget.dataOrigin;
  List data_promosiList = [];
  bool loading = true;
  double total_harga = 0;
  bool modeFilter = false;

  @override
  initState() {
    super.initState();
    List<KompetitorPromo> copyBox = List.of(originalData);
    copyBox.sort((b, a) => b.namaPromosi!
        .toString()
        .toLowerCase()
        .compareTo(a.namaPromosi.toString().toLowerCase()));
    databox.value = copyBox;
    // getData();
  }

  void refresh(BuildContext context) async {
    context.read<PromoCompetitorBloc>().add(
        PromoCompetitorEvent.getPromoCompetitor(
            FormData.fromMap({"id_outlet": widget.id_outlet.toString()})));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => Future.sync(() => refresh(context)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              headerForm(),
              filterView(),
              Flexible(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: databox.value.isEmpty
                          ? barangKosong(context)
                          : ValueListenableBuilder<List<KompetitorPromo>>(
                              valueListenable: databox,
                              builder: (context, value, child) =>
                                  ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: value.length,
                                    itemBuilder: (context, index) =>
                                        produkCard(context, value[index]),
                                  )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          TambahPromosiKomptetitorView(widget.id_outlet)))
              .then((value) {
            if (value != null && value == true) {
              refresh(context);
            }
          });
        },
        backgroundColor: XAppColors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  //ANCHOR - Filtered Default by Name and Switch to Highest Price
  void filter() {
    List<KompetitorPromo> copyBox = List.of(originalData);
    if (modeFilter) {
      copyBox.sort((a, b) => b.harga
          .toString()
          .toLowerCase()
          .compareTo(a.harga.toString().toLowerCase()));
      setState(() {
        databox.value = copyBox;
      });
    } else {
      copyBox.sort((b, a) => b.namaPromosi
          .toString()
          .toLowerCase()
          .compareTo(a.namaPromosi.toString().toLowerCase()));
      setState(() {
        databox.value = copyBox;
      });
    }
  }

  //ANCHOR - Get Total Price
  totalPrice() {
    double sum =
        originalData.fold(0, (sum, element) => sum.toDouble() + element.harga!);
    return sum;
  }

  // //ANCHOR - Get Total Omset
  // totalOmset() {
  //   double sum =
  //       originalData.fold(0, (sum, element) => sum.toDouble() + int.parse(element.harga!) );
  //   return sum;
  // }

  //ANCHOR - Filtered Item from User Input
  void filterSearchResults(String query) {
    List<KompetitorPromo> dummySearchList = [];
    dummySearchList.addAll(originalData);
    if (query.isNotEmpty) {
      List<KompetitorPromo> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.namaPromosi!.toLowerCase().contains(query.toLowerCase())) {
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
        List<KompetitorPromo> copyBox = List.of(originalData);
        databox.value.clear();
        copyBox.sort((b, a) => b.namaPromosi
            .toString()
            .toLowerCase()
            .compareTo(a.namaPromosi.toString().toLowerCase()));
        databox.value.addAll(copyBox);
      });
    }
  }

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
                      'Data Update Kompetitor',
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
                                builder: (con) =>
                                    SearchPromosiKompetitor(widget.id_outlet))
                            .then((value) {
                          if (value != null) {
                            if (value == true) {
                              // getData();
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
                              const Text("Total Promo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: XAppColors.grey,
                                  )),
                              Text(
                                "${databox.value.length}",
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
                modeFilter = false;
                filter();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    (modeFilter == false) ? XAppColors.green : Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Semua",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: (modeFilter == false) ? Colors.white : XAppColors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                modeFilter = true;
                filter();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    (modeFilter == true) ? XAppColors.green : Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Harga Tertinggi",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: (modeFilter == true) ? Colors.white : XAppColors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget produkCard(BuildContext context, KompetitorPromo value) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (con) =>
                DetailPromosiKompetitor(widget.id_outlet, value)).then((value) {
          if (value != null && value == true) {
            refresh(context);
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
                    imageUrl: value.image ?? "",
                    size: const Size(42, 43),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.namaPromosi ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        config().format_rupiah(value.harga.toString())!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat.yMMMEd(
                    "ID",
                  ).format(DateTime.parse(value.updatedAt!)).toString(),
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
      ),
    );
  }

  Widget barangKosong(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/produk_kosong.png",
                height: 85,
              ),
              const SizedBox(height: 42),
              Text(
                'Promosi Kosong',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: XAppColors.primaryColors,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Silahkan untuk tambah promo terlebih dahulu',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
