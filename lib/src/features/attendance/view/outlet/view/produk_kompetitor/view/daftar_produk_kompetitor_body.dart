import 'dart:convert';
import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_act_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/detail_produk_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/edit_omset_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/search_produk_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/tambah_aktifitas_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/tambah_produk_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/widget/barangKosong.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_activity.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_product.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class DaftarProdukKompetitorBody extends StatefulWidget {
  final int idOutlet;
  final List<KompetitorProduct> dataOrigin;

  const DaftarProdukKompetitorBody(this.idOutlet, this.dataOrigin, {super.key});

  @override
  State<DaftarProdukKompetitorBody> createState() =>
      _DaftarProdukKompetitorBodyState();
}

class _DaftarProdukKompetitorBodyState
    extends State<DaftarProdukKompetitorBody> {
  ValueNotifier<List<KompetitorProduct>> databox = ValueNotifier([]);
  late List<KompetitorProduct> originalData = widget.dataOrigin;
  List data_produkList = [];
  List aktifitasKompetitorList = [];
  bool loading = true;
  double total_harga = 0;
  double total_omset = 0;
  bool modeFilter = false;

  @override
  initState() {
    super.initState();
    activityCompetitor();
    List<KompetitorProduct> copyBox = List.of(originalData);
    copyBox.sort((b, a) => b.name!
        .toString()
        .toLowerCase()
        .compareTo(a.name.toString().toLowerCase()));
    databox.value = copyBox;
    // getData();
  }

  void activityCompetitor() async {
    context.read<CompetitorActBloc>().add(
        CompetitorActEvent.getCompetitorActivityAll(
            {"id_outlet": widget.idOutlet}));
  }

  void refresh() async {
    context
        .read<CompetitorBloc>()
        .add(CompetitorEvent.getCompetitorProducts(widget.idOutlet.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => refresh(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
                            : ValueListenableBuilder<List<KompetitorProduct>>(
                                valueListenable: databox,
                                builder: (context, value, child) =>
                                    ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: value.length,
                                      itemBuilder: (context, index) =>
                                          produkCard(
                                              context, index, value[index]),
                                    )),
                      ),
                      const SizedBox(height: Constants.kFontSizeM),
                      Expanded(
                        child: Container(
                          color: Colors.grey[100],
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 5),
                          child: const Text(
                            "Riwayat Aktivitas Kompetitor",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      BlocBuilder<CompetitorActBloc, CompetitorActState>(
                          builder: (context, state) {
                        return Container(
                          color: Colors.grey[100],
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: state.whenOrNull(
                            competitorActivityAll: (data) {
                              return ListView(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                children: List.generate(data.length,
                                    (index) => aktifitasCard(data[index])),
                              );
                            },
                          ),
                        );
                      })
                    ]),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        distance: 70,
        backgroundColor: XAppColors.green,
        child: const Icon(Icons.add),
        children: [
          InkWell(
            child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF7A87B),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  children: const [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Tambah Aktivitas Kompetitor",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (con) =>
                      TambahAktifitasKompetitor(widget.idOutlet)).then((value) {
                if (value != null && value == true) {
                  // getData();
                }
              });
            },
          ),
          // InkWell(
          //   child: Container(
          //       decoration: BoxDecoration(
          //         color: const Color(0xffF77B7B),
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          //       child: Row(
          //         children: const [
          //           Icon(
          //             Icons.edit,
          //             color: Colors.white,
          //           ),
          //           SizedBox(width: 8),
          //           Text(
          //             "Edit Omzet Kompetitor",
          //             style: TextStyle(
          //               fontSize: 10,
          //               fontWeight: FontWeight.w700,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ],
          //       )),
          //   onTap: () {
          //     showModalBottomSheet(
          //             context: context,
          //             isScrollControlled: true,
          //             backgroundColor: Colors.transparent,
          //             builder: (con) => EditOmsetKompetitor(widget.idOutlet))
          //         .then((value) {
          //       if (value != null && value == true) {
          //         // getData();
          //       }
          //     });
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: InkWell(
              child: Container(
                  decoration: BoxDecoration(
                    color: XAppColors.primaryColors,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Tambah Produk Kompetitor",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                TambahProdukKomptetitorView(widget.idOutlet)))
                    .then((value) {
                  if (value != null && value == true) {
                    refresh();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  //ANCHOR - Filtered Default by Name and Switch to Highest Price
  void filter() {
    List<KompetitorProduct> copyBox = List.of(originalData);
    if (modeFilter) {
      // copyBox.sort((a, b) => b.price
      //     .toString()
      //     .toLowerCase()
      //     .compareTo(a.price.toString().toLowerCase()));
      // setState(() {
      //   databox.value = copyBox;
      // });
    } else {
      copyBox.sort((b, a) => b.name
          .toString()
          .toLowerCase()
          .compareTo(a.name.toString().toLowerCase()));
      setState(() {
        databox.value = copyBox;
      });
    }
  }

  //ANCHOR - Get Total Price
  // totalPrice() {
  //   double sum =
  //       originalData.fold(0, (sum, element) => sum.toDouble() + element.price!);
  //   return sum;
  // }

  //ANCHOR - Get Total Omset
  totalOmset() {
    double sum =
        originalData.fold(0, (sum, element) => sum.toDouble() + element.omset!);
    return sum;
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
                      'Kompetitor',
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
                                    SearchProdukKompetitor(widget.idOutlet))
                            .then((value) {
                          if (value != null) {
                            if (value == true) {
                              // getData();
                            } else {
                              data_produkList = value;
                              total_omset = 0;
                              total_harga = 0;
                              for (int i = 0; i < data_produkList.length; i++) {
                                total_omset += double.tryParse(
                                        data_produkList[i]['omset']
                                            .toString()) ??
                                    0;
                                total_harga += double.tryParse(
                                        data_produkList[i]['harga']
                                            .toString()) ??
                                    0;
                              }
                              setState(() {});
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
                      // Expanded(
                      //   flex: 4,
                      //   child: SizedBox(
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: <Widget>[
                      //         const Text("Total Harga",
                      //             style: TextStyle(
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 12,
                      //               color: XAppColors.grey,
                      //             )),
                      //         Text(
                      //           config()
                      //               .format_rupiah(totalPrice().toString())!,
                      //           style: const TextStyle(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 14,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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

  Widget produkCard(BuildContext context, int index, KompetitorProduct value) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (con) =>
                DetailProdukKompetitor(widget.idOutlet, value)).then((value) {
          if (value != null && value == true) {
            refresh();
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
                      // Text(
                      //   config().format_rupiah(value.price.toString())!,
                      //   style: const TextStyle(
                      //     fontSize: 10,
                      //     fontWeight: FontWeight.w400,
                      //     color: XAppColors.grey,
                      //   ),
                      // ),
                      Text(
                        value.name ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Omset : ${config().format_rupiah(value.omset.toString())}",
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
                  value.updatedAt != null
                      ? DateFormat.yMMMEd(
                          "ID",
                        ).format(DateTime.parse(value.updatedAt!))
                      : '',
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

  Widget aktifitasCard(KompetitorAktivitas value) {
    return Container(
      color: const Color(0xffF6F8FA),
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                DateFormat.E(
                  "ID",
                ).format(DateTime.parse(value.createdAt!)).toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat.d(
                  "ID",
                ).format(DateTime.parse(value.createdAt!)).toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: XAppColors.green,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: XAppColors.green),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 174,
                    width: 5,
                    decoration: const BoxDecoration(
                        color: XAppColors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        )),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: XAppColors.greenMuda,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/ic_outlet.png",
                                height: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.keterangan ?? "-",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMMMEd(
                                      "ID",
                                    )
                                        .format(
                                            DateTime.parse(value.createdAt!))
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: XCacheNetworkImage(
                          imageUrl: value.image ?? "",
                          size: const Size(100, 100),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
