import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/bloc/promo_competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/edit_promosi_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/tambah_promosi_kompetitor.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_promo.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailPromosiKompetitor extends StatefulWidget {
  final int id_outlet;
  final KompetitorPromo promo;

  const DetailPromosiKompetitor(this.id_outlet, this.promo, {super.key});

  @override
  State<DetailPromosiKompetitor> createState() =>
      _DetailPromosiKompetitorState();
}

class _DetailPromosiKompetitorState extends State<DetailPromosiKompetitor> {
  TextEditingController searchController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoCompetitorBloc>(
      create: (context) => PromoCompetitorBloc(),
      child: Builder(builder: (context) {
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
                      'Data Promo',
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
                          imageUrl: widget.promo.image ?? "",
                          size: const Size(43, 43),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.promo.namaPromosi ?? "-",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              config().format_rupiah(
                                  widget.promo.harga.toString())!,
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
                        )
                            .format(DateTime.parse(widget.promo.updatedAt!))
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: XButton(
                      title: "Edit",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditPromosiKomptetitorView(
                                    widget.id_outlet,
                                    data_edit: widget.promo))).then((value) {
                          if (value != null && value == true) {
                            Navigator.pop(context, true);
                          } else {
                            Navigator.pop(context);
                          }
                        });
                      },
                      width: MediaQuery.of(context).size.width,
                      enabled: !loading,
                      busy: false,
                      backgroundColor: XAppColors.green,
                    ),
                  ),
                  BlocListener<PromoCompetitorBloc, PromoCompetitorState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        deletedCompetitorPromo: (data) {
                          setState(() {
                            loading = false;
                          });
                          XToast.show("Berhasil menghapus promo");
                          Navigator.pop(context, true);
                        },
                        isError: (networkExceptions) {
                          FlashMessage.error(
                              context: context, title: "Promo gagal di hapus");
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: XButton(
                        title: "Hapus",
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          BlocProvider.of<PromoCompetitorBloc>(context).add(
                              PromoCompetitorEvent.deletePromoCompetitor(
                                  widget.promo.id.toString()));
                        },
                        width: MediaQuery.of(context).size.width,
                        enabled: !loading,
                        busy: loading,
                        backgroundColor: XAppColors.danger,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // void deleteData() {
  //   Api().deletePromosiKompetitor(widget.promo.id.toString()).then((value) {
  //     setState(() {
  //       loading = false;
  //     });
  //     if (value != null) {
  //       if (config.isJsonValid(value)) {
  //         var response = jsonDecode(value);
  //         if (response['status'] == true) {
  //           XToast.show("Berhasil menghapus promo");
  //           Navigator.pop(context, true);
  //         } else {
  //           FlashMessage.error(
  //               context: context,
  //               title: "Promo gagal di hapus",
  //               message: response['message'].toString());
  //         }
  //       } else {
  //         FlashMessage.error(context: context, title: "Promo gagal di hapus");
  //       }
  //     } else {
  //       FlashMessage.error(context: context, title: "Promo gagal di hapus");
  //     }
  //   });
  // }
}
