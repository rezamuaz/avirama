import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/bloc/promo_periode_bloc.dart';
import 'package:absensi_app/src/network/model/outlet/promo_periode.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/date_range_picker.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditPeriodePromosi extends StatefulWidget {
  final PromoPeriode dataPeriode;
  final bool? edit_langsung;
  final int? id_promo;

  const EditPeriodePromosi(this.dataPeriode,
      {super.key, this.edit_langsung = false, this.id_promo});

  @override
  State<EditPeriodePromosi> createState() => _EditPeriodePromosiState();
}

class _EditPeriodePromosiState extends State<EditPeriodePromosi> {
  TextEditingController periodeController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController hargaNormalController = TextEditingController();
  TextEditingController hargaPromoController = TextEditingController();
  TextEditingController pcsController = TextEditingController();
  bool loading = false;
  String? tanggal_awal;
  String? tanggal_akhir;
  String? range;

  @override
  void initState() {
    super.initState();
    periodeController.text = widget.dataPeriode.periode ?? "";
    keteranganController.text = widget.dataPeriode.keterangan ?? "";
    hargaNormalController.text = widget.dataPeriode.hargaNormal == null
        ? ""
        : widget.dataPeriode.hargaNormal.toString();
    hargaPromoController.text = widget.dataPeriode.hargaPromo == null
        ? ""
        : widget.dataPeriode.hargaPromo.toString();
    pcsController.text = widget.dataPeriode.pcs ?? "";
    tanggal_awal = DateFormat("yyyy-MM-dd").format(DateTime.now());
    tanggal_akhir = DateFormat("yyyy-MM-dd").format(DateTime.now());
    range =
        "${DateFormat("yyyy/MM/dd").format(DateTime.now())} - ${DateFormat("yyyy/MM/dd").format(DateTime.now())}";
  }

  String dateConvert(String date) {
    return DateFormat("dd MMM yyyy", "ID")
        .format(DateTime.parse(date))
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoPeriodeBloc>(
      create: (context) => PromoPeriodeBloc(),
      child: Builder(builder: (context) {
        return BlocListener<PromoPeriodeBloc, PromoPeriodeState>(
          listener: (context, state) {
            state.whenOrNull(
              editedPromoPeriode: (data) {
                setState(() {
                  loading = false;
                });
                XToast.show("Periode berhasil di tambahkan");
                Navigator.pop(context, true);
              },
              errorEditedPeriode: (data) {
                FlashMessage.error(
                    context: context, title: "Gagal mengedit periode");
              },
            );
          },
          child: Column(
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
                        'Edit Periode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: (const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: periodeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Waktu Periode",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: XAppColors.grey,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.watch_later,
                              color: XAppColors.grey,
                              size: 18,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 5, top: 5, right: 15),
                          ),
                          readOnly: false,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        content: DateRangePicker(
                                      tanggal_awal: tanggal_awal,
                                      tanggal_akhir: tanggal_akhir,
                                      range: range,
                                    ))).then((value) {
                              if (value != null) {
                                tanggal_awal = value['tanggal_awal'];
                                tanggal_akhir = value['tanggal_akhir'];
                                setState(() {
                                  periodeController.text =
                                      "${dateConvert(tanggal_awal!)} - ${dateConvert(tanggal_akhir!)}";
                                });
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: (const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: keteranganController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Keterangan Promo",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: XAppColors.grey,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.discount,
                              color: XAppColors.grey,
                              size: 18,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 5, top: 5, right: 15),
                          ),
                          readOnly: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: (const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: hargaNormalController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Harga Normal",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: XAppColors.grey,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.price_change,
                              color: XAppColors.grey,
                              size: 18,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 5, top: 5, right: 15),
                          ),
                          readOnly: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: (const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: hargaPromoController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Harga Promo",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: XAppColors.grey,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.price_change,
                              color: XAppColors.grey,
                              size: 18,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 5, top: 5, right: 15),
                          ),
                          readOnly: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: (const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: pcsController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "PCS",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: XAppColors.grey,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.production_quantity_limits,
                              color: XAppColors.grey,
                              size: 18,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 5, top: 5, right: 15),
                          ),
                          readOnly: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: XButton(
                        title: "Edit",
                        onPressed: () {
                          if (periodeController.text.isNotEmpty) {
                            if (keteranganController.text.isNotEmpty) {
                              if (hargaNormalController.text.isNotEmpty) {
                                if (hargaPromoController.text.isNotEmpty) {
                                  if (pcsController.text.isNotEmpty) {
                                    setState(() {
                                      loading = true;
                                    });
                                    Map<String, dynamic> data = {};
                                    data['harga_promo'] =
                                        hargaPromoController.text;
                                    data['harga_normal'] =
                                        hargaNormalController.text;
                                    data['keterangan'] =
                                        keteranganController.text;
                                    data['periode'] = periodeController.text;
                                    data['pcs'] = pcsController.text;
                                    data['id'] = widget.dataPeriode.id;
                                    data['id_promo'] =
                                        widget.id_promo.toString();
                                    BlocProvider.of<PromoPeriodeBloc>(context)
                                        .add(PromoPeriodeEvent.editPromoPeriode(
                                            data));
                                  } else {
                                    XToast.show("Silahkan Isi PCS");
                                  }
                                } else {
                                  XToast.show("Silahkan Isi harga promo");
                                }
                              } else {
                                XToast.show("Silahkan Isi harga normal");
                              }
                            } else {
                              XToast.show("Silahkan Isi keterangan");
                            }
                          } else {
                            XToast.show("Silahkan Isi periode");
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        enabled: !loading,
                        busy: loading,
                        backgroundColor: XAppColors.primaryColors,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
