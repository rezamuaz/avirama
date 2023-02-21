import 'dart:convert';
import 'dart:developer';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/pilih_produk_outlet.dart';
import 'package:absensi_app/src/features/report/bloc/bloc/report_bloc.dart';
import 'package:absensi_app/src/features/report/pilih_pengguna.dart';
import 'package:absensi_app/src/features/report/widget/select_outlet_report.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:absensi_app/src/network/model/report/outlet_report.dart';
import 'package:absensi_app/src/network/model/report/user_report.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class TambahReportView extends StatefulWidget {
  const TambahReportView({Key? key}) : super(key: key);

  @override
  State<TambahReportView> createState() => _TambahReportViewState();
}

class _TambahReportViewState extends State<TambahReportView> {
  TextEditingController report_to_idController = TextEditingController();
  TextEditingController report_by_idController = TextEditingController();
  TextEditingController outletController = TextEditingController();
  TextEditingController produkController = TextEditingController();
  TextEditingController namaprodukController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController actionController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  Map<String, String> reportParams = <String, String>{};
  String? tlId;
  String? mdId;
  String? outletId;
  String? produkOutlet;
  bool loading = false;
  bool validForm = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Report',
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
          backgroundColor: XAppColors.primaryColors,
        ),
        body: Builder(builder: (context) {
          return BlocConsumer<ReportBloc, ReportState>(
            listener: (context, state) {
              state.whenOrNull(
                sendReportLoading: () {
                  setState(() {
                    loading = true;
                  });
                },
                reportSended: (message) {
                  setState(() {
                    loading = false;
                    XToast.show("Berhasil mengirim report");
                    Navigator.pop(context, true);
                  });
                },
                isError: (networkExceptions) {
                  FlashMessage.error(
                      context: context, title: "Gagal mengirim report");
                },
              );
            },
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      //ANCHOR - Field For TL
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: report_to_idController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "TL",
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
                                Icons.person,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5, right: 15),
                            ),
                            readOnly: true,
                            onTap: () {
                              context
                                  .read<ReportBloc>()
                                  .add(const ReportEvent.getUserReport("TL"));
                              state.maybeWhen(
                                orElse: () => {},
                                userReportLoaded: (data) {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PilihPengguna(
                                                data: data,
                                                loading: state.maybeWhen(
                                                    orElse: () => true,
                                                    isLoading: () => true,
                                                    userReportLoaded: (data) =>
                                                        false),
                                              ))).then((value) {
                                    if (value != null) {
                                      UserReport tl = value;
                                      report_to_idController.text =
                                          tl.name != null
                                              ? tl.name.toString()
                                              : "";
                                      setState(() {
                                        tlId = tl.id.toString();
                                      });
                                      validasiForm();
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),

                      //ANCHOR - Field for MD
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: report_by_idController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "MD",
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
                                Icons.person,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5, right: 15),
                            ),
                            readOnly: true,
                            onTap: () {
                              context
                                  .read<ReportBloc>()
                                  .add(const ReportEvent.getUserReport("MD"));
                              state.maybeWhen(
                                orElse: () => {},
                                userReportLoaded: (data) {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PilihPengguna(
                                                data: data,
                                                loading: state.maybeWhen(
                                                    orElse: () => true,
                                                    isLoading: () => true,
                                                    userReportLoaded: (data) =>
                                                        false),
                                              ))).then((value) {
                                    if (value != null) {
                                      UserReport md = value;
                                      report_by_idController.text =
                                          md.name != null
                                              ? md.name.toString()
                                              : "";
                                      setState(() {
                                        mdId = md.id.toString();
                                      });
                                      validasiForm();
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),

                      //ANCHOR - Field for Outlet
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: outletController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Outlet",
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
                                Icons.person,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5, right: 15),
                            ),
                            readOnly: true,
                            onTap: () async {
                              context
                                  .read<ReportBloc>()
                                  .add(const ReportEvent.getOutletList());
                              state.whenOrNull(outletListLoaded: (data) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SelectOutletReport(
                                              outletList: data,
                                              loading: state.maybeWhen(
                                                  orElse: () => true,
                                                  isLoading: () => true,
                                                  outletListLoaded: (data) =>
                                                      false),
                                            ))).then((value) {
                                  if (value != null) {
                                    OutletReport outlet = value;
                                    outletController.text = outlet.name ?? "";
                                    setState(() {
                                      outletId = outlet.id;
                                    });
                                    validasiForm();
                                  }
                                });
                              });
                            },
                          ),
                        ),
                      ),

                      //ANCHOR - Field for Action
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: actionController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Action",
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
                            onSaved: (value) {
                              validasiForm();
                            },
                            onEditingComplete: () {
                              validasiForm();
                            },
                            onFieldSubmitted: (value) {
                              validasiForm();
                            },
                          ),
                        ),
                      ),

                      //ANCHOR - Field for Product
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: produkController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Product",
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
                                Icons.person,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5, right: 15),
                            ),
                            readOnly: true,
                            onTap: () {
                              if (outletController.text.isEmpty) {
                                return FlashMessage.error(
                                    context: context,
                                    title: "Gagal Memilih Produk",
                                    message: "Silakan Pilih Outlet");
                              }
                              context.read<ReportBloc>().add(
                                  ReportEvent.getProductOutletList(outletId!));
                              state.whenOrNull(productListLoaded: (data) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PilihProdukOutlet(
                                              product: data,
                                              loading: state.maybeWhen(
                                                orElse: () => true,
                                                isLoading: () => true,
                                                productListLoaded: (data) =>
                                                    false,
                                              ),
                                              kosong: state.maybeWhen(
                                                orElse: () => true,
                                                productListLoaded: (data) =>
                                                    false,
                                                isError: (error) =>
                                                    error.maybeWhen(
                                                  notFound: (reason) => true,
                                                  orElse: () => true,
                                                ),
                                              ),
                                            ))).then((value) {
                                  if (value != null) {
                                    ProductOutlet produkOutlet = value;
                                    produkController.text =
                                        produkOutlet.id ?? "";
                                    namaprodukController.text =
                                        produkOutlet.product!.name ?? "";
                                    validasiForm();
                                  }
                                });
                              });
                            },
                          ),
                        ),
                      ),
                      //ANCHOR - Field Product Name
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: namaprodukController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Name Product",
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
                                Icons.person,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5, right: 15),
                            ),
                            readOnly: true,
                          ),
                        ),
                      ),

                      //ANCHOR - Field for Size
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: sizeController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Size",
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
                                Icons.person,
                                color: XAppColors.grey,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5, right: 15),
                            ),
                            onSaved: (value) {
                              validasiForm();
                            },
                            onEditingComplete: () {
                              validasiForm();
                            },
                            onFieldSubmitted: (value) {
                              validasiForm();
                            },
                          ),
                        ),
                      ),

                      //ANCHOR - Field for Problem
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: problemController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Problem",
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
                            onSaved: (value) {
                              validasiForm();
                            },
                            onEditingComplete: () {
                              validasiForm();
                            },
                            onFieldSubmitted: (value) {
                              validasiForm();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      //ANCHOR - Field for Keterangan
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Keterangan",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8)),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: keteranganController,
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Keterangan",
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
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                            onSaved: (value) {
                              validasiForm();
                            },
                            onEditingComplete: () {
                              validasiForm();
                            },
                            onFieldSubmitted: (value) {
                              validasiForm();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
        bottomNavigationBar: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: XButton(
              width: MediaQuery.of(context).size.width,
              backgroundColor: XAppColors.green,
              onPressed: () async {
                validasiForm();
                if (validForm && loading == false) {
                  simpanData();
                  context
                      .read<ReportBloc>()
                      .add(ReportEvent.sendReport(reportParams));
                  XToast.show("Berhasil mengirim report");
                  Navigator.pop(context, true);
                } else {
                  FlashMessage.error(
                      context: context,
                      title: "Gagal mengirim report",
                      message: "Pastikan Semua Data Terisi Dengan Lengkap");
                }
              },
              busy: false,
              enabled: true,
              title: "Kirim Laporan",
            ),
          );
        }),
      ),
    );
  }

  void validasiForm() {
    if (report_to_idController.text.isNotEmpty) {
      if (report_by_idController.text.isNotEmpty) {
        if (outletController.text.isNotEmpty) {
          if (actionController.text.isNotEmpty) {
            if (produkController.text.isNotEmpty) {
              if (namaprodukController.text.isNotEmpty) {
                if (sizeController.text.isNotEmpty) {
                  if (problemController.text.isNotEmpty) {
                    setState(() {
                      validForm = true;
                    });
                  } else {
                    setState(() {
                      validForm = false;
                    });
                  }
                } else {
                  setState(() {
                    validForm = false;
                  });
                }
              } else {
                setState(() {
                  validForm = false;
                });
              }
            } else {
              setState(() {
                validForm = false;
              });
            }
          } else {
            setState(() {
              validForm = false;
            });
          }
        } else {
          setState(() {
            validForm = false;
          });
        }
      } else {
        setState(() {
          validForm = false;
        });
      }
    } else {
      setState(() {
        validForm = false;
      });
    }
  }

  void simpanData() {
    Map<String, String> params = <String, String>{};
    params['report_to_id'] = tlId.toString();
    params['report_by_id'] = mdId.toString();
    params['id_outlet'] = outletId.toString();
    params['id_product'] = produkController.text.toString();
    params['problem'] = problemController.text.toString();
    params['size'] = sizeController.text.toString();
    params['action'] = actionController.text.toString();
    params['keterangan'] = keteranganController.text.toString();

    setState(() {
      reportParams = params;
    });
  }
}
