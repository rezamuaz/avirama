import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/edit_produk_kompetitor.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_product.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class DetailProdukKompetitor extends StatefulWidget {
  final int id_outlet;
  final KompetitorProduct produk;

  const DetailProdukKompetitor(this.id_outlet, this.produk, {super.key});

  @override
  State<DetailProdukKompetitor> createState() => _DetailProdukKompetitorState();
}

class _DetailProdukKompetitorState extends State<DetailProdukKompetitor> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompetitorBloc>(
      create: (context) => CompetitorBloc(),
      child: SizedBox(
        child: Builder(builder: (context) {
          return BlocConsumer<CompetitorBloc, CompetitorState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {
                  FlashMessage.error(
                      context: context, title: "Produk gagal di hapus");
                },
                isLoading: () {
                  // setState(() {
                  //   loading = true;
                  // });
                },
                deletedCompetitorProduct: (data) {
                  setState(() {
                    loading = false;
                  });
                  if (data.data['status'] = true) {
                    XToast.show("Berhasil menghapus produk");
                    Navigator.pop(context, true);
                  }
                },
              );
            },
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 24, bottom: 10),
                          child: Text(
                            'Data Produk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: XCacheNetworkImage(
                                imageUrl: widget.produk.image ?? "",
                                size: const Size(43, 43),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.produk.name ?? "-",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  // Text(
                                  //   config().format_rupiah(
                                  //       widget.produk.price.toString())!,
                                  //   style: const TextStyle(
                                  //     fontSize: 10,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: XAppColors.grey,
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 3),
                                  Text(
                                    "Omset : ${config().format_rupiah(widget.produk.omset.toString())!}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.greenAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            widget.produk.updatedAt != null
                                ? Text(
                                    DateFormat.yMMMEd(
                                      "ID",
                                    )
                                        .format(DateTime.parse(
                                            widget.produk.updatedAt!))
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(width: 16),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 16, vertical: 8),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(
                        //         "Type",
                        //         style: TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       Text(
                        //         "${widget.produk.type}",
                        //         style: const TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Deskripsi",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${widget.produk.cat}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 16, vertical: 8),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(
                        //         "Pack",
                        //         style: TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       Text(
                        //         "${widget.produk.pack}",
                        //         style: const TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 16, vertical: 8),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(
                        //         "Ukuran",
                        //         style: TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       Text(
                        //         "${widget.produk.size}",
                        //         style: const TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 16, vertical: 8),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(
                        //         "Volume",
                        //         style: TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       Text(
                        //         "${widget.produk.vol}",
                        //         style: const TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: XButton(
                            title: "Edit",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EditProdukKomptetitorView(
                                          widget.produk,
                                          widget.id_outlet))).then((value) {
                                if (value != null && value == true) {
                                  Navigator.pop(context, true);
                                }
                              });
                            },
                            width: MediaQuery.of(context).size.width,
                            enabled: !loading,
                            busy: false,
                            backgroundColor: XAppColors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: XButton(
                            title: "Hapus Produk",
                            onPressed: () {
                              setState(() {
                                loading = true;
                                deleteData(context);
                              });
                            },
                            width: MediaQuery.of(context).size.width,
                            enabled: !loading,
                            busy: loading,
                            backgroundColor: XAppColors.danger,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }

  void deleteData(BuildContext context) {
    BlocProvider.of<CompetitorBloc>(context).add(
        CompetitorEvent.deleteCompetitorProduct(widget.produk.id.toString()));
  }
}
