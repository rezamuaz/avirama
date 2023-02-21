import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/widget/barang_kosong.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';

class DaftarProductOutletEmpty extends StatefulWidget {
  const DaftarProductOutletEmpty({super.key});

  @override
  State<DaftarProductOutletEmpty> createState() =>
      _DaftarProductOutletEmptyState();
}

class _DaftarProductOutletEmptyState extends State<DaftarProductOutletEmpty> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerForm(),
        filterView(),
        Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: barangKosong(context))),
      ],
    );
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
                      onPressed: () {},
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
                            children: const <Widget>[
                              Text("Total Produk",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: XAppColors.grey,
                                  )),
                              Text(
                                "0",
                                style: TextStyle(
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
                                config().format_rupiah("0")!,
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
                        child: Container(
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
                                config().format_rupiah("0")!,
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
        children: const [
          // GestureDetector(
          //   onTap: () {
          //     // setState(() {
          //     //   modeFilter = false;
          //     //   filter();
          //     // });
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color:
          //           (modeFilter == false) ? XAppColors.green : Colors.grey[100],
          //       borderRadius: BorderRadius.circular(4),
          //     ),
          //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //     child: Text(
          //       "Semua",
          //       style: TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w400,
          //         color: (modeFilter == false) ? Colors.white : XAppColors.grey,
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(width: 12),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       modeFilter = true;
          //       filter();
          //     });
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color:
          //           (modeFilter == true) ? XAppColors.green : Colors.grey[100],
          //       borderRadius: BorderRadius.circular(4),
          //     ),
          //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //     child: Text(
          //       "Harga Tertinggi",
          //       style: TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w400,
          //         color: (modeFilter == true) ? Colors.white : XAppColors.grey,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
