import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/bloc/promo_competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/bloc/promo_periode_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/edit_periode_promosi.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/tambah_periode_promosi.dart';
import 'package:absensi_app/src/localization/localization_utils.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_promo.dart';
import 'package:absensi_app/src/network/model/outlet/promo_periode.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/bottom_select_option.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class EditPromosiKomptetitorView extends StatefulWidget {
  final int id_outlet;
  final KompetitorPromo? data_edit;

  const EditPromosiKomptetitorView(this.id_outlet, {super.key, this.data_edit});

  @override
  State<EditPromosiKomptetitorView> createState() =>
      _EditPromosiKomptetitorViewState();
}

class _EditPromosiKomptetitorViewState
    extends State<EditPromosiKomptetitorView> {
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  List<PromoPeriode> dataPeriodeList = [];
  bool loading = false;
  bool valid_form = false;
  XFile? pickedFile;

  @override
  initState() {
    super.initState();
    if (widget.data_edit != null) {
      namaController.text = widget.data_edit!.namaPromosi ?? "";
      hargaController.text = widget.data_edit!.harga == null
          ? ""
          : widget.data_edit!.harga.toString();
      validasi_form();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PromoPeriodeBloc>(
          create: (context) => PromoPeriodeBloc()
            ..add(PromoPeriodeEvent.getPromoPeriode(
                {"id_promo": widget.data_edit!.id.toString()})),
        ),
        BlocProvider<PromoCompetitorBloc>(
          create: (context) => PromoCompetitorBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            (widget.data_edit == null) ? 'Tambah Promo' : 'Edit Promo',
            style: const TextStyle(
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
          return MultiBlocListener(
            listeners: [
              BlocListener<PromoCompetitorBloc, PromoCompetitorState>(
                listener: (context, state) {
                  state.whenOrNull(
                    addedCompetitorPromo: (data) {
                      if (data.data['status'] = false) {
                        FlashMessage.error(
                            context: context,
                            title: (widget.data_edit == null)
                                ? "Promo gagal di tambahkan"
                                : "Promo gagal di update");
                      } else {
                        XToast.show("Promo berhasil di tambahkan");
                        Navigator.pop(context, true);
                      }
                    },
                    updatedCompetitorPromo: (data) {
                      if (data.data['status'] == false) {
                        FlashMessage.error(
                            context: context,
                            title: (widget.data_edit == null)
                                ? "Promo gagal di tambahkan"
                                : "Promo gagal di update");
                      } else {
                        XToast.show("Promo berhasil di update");
                        Navigator.pop(context, true);
                      }
                    },
                    isErrorAdded: (networkExceptions) {
                      FlashMessage.error(
                          context: context,
                          title: (widget.data_edit == null)
                              ? "Promo gagal di tambahkan"
                              : "Promo gagal di update");
                    },
                    isErrorUpdated: (networkExceptions) {
                      FlashMessage.error(
                          context: context,
                          title: (widget.data_edit == null)
                              ? "Promo gagal di tambahkan"
                              : "Promo gagal di update");
                    },
                  );
                },
              ),
              BlocListener<PromoPeriodeBloc, PromoPeriodeState>(
                listener: (context, state) {
                  state.whenOrNull(
                    deletedPromoPeriode: (data) {
                      hideLoading();
                      if (data.data['status'] = true) {
                        XToast.show("Berhasil menghapus periode");
                        refresh(context);
                      } else {
                        FlashMessage.error(
                            context: context,
                            title: "Periode gagal di hapus",
                            message: data.data['message'].toString());
                      }
                    },
                    error: (error) {
                      FlashMessage.error(
                          context: context, title: "Periode gagal di hapus");
                    },
                  );
                },
              ),
            ],
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    //nama
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nama",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: namaController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Nama",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                              onFieldSubmitted: (value) {
                                validasi_form();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    //harga
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Harga Normal",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: hargaController,
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                              onFieldSubmitted: (value) {
                                validasi_form();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (pickedFile != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Image.file(
                          File(pickedFile!.path),
                          width: 96,
                          height: 96,
                        ),
                      ),
                    if (widget.data_edit != null && pickedFile == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: XCacheNetworkImage(
                            imageUrl: widget.data_edit!.image ?? "",
                            size: const Size(96, 96),
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Data Periode",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Builder(
                        builder: (context) => (widget.data_edit == null)
                            ? const SizedBox()
                            : BlocBuilder<PromoPeriodeBloc, PromoPeriodeState>(
                                builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () {
                                    return const SizedBox();
                                  },
                                  promoPeriodeAll: (data) {
                                    return data.isEmpty
                                        ? const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Text(
                                              "Data Periode Kosong",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: XAppColors.grey,
                                              ),
                                            ),
                                          )
                                        : Column(
                                            children: List.generate(
                                                data.length,
                                                (index) => periodeCard(
                                                    data[index], index)));
                                  },
                                );
                              }))
                  ],
                ),
              ),
            ),
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.data_edit == null
                  ? const SizedBox()
                  : Builder(builder: (context) {
                      return XButton(
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: const Color(0xffF7A07B),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (con) => TambahPeriodePromosi(
                                    dataPeriodeList,
                                    edit_langsung: (widget.data_edit != null),
                                    id_promo: (widget.data_edit != null)
                                        ? widget.data_edit!.id
                                        : null,
                                  )).then((value) {
                            if (value != null) {
                              refresh(context);
                              validasi_form();
                            }
                          });
                        },
                        title: "Tambah Periode",
                        child: Row(
                          children: const [
                            Icon(Icons.add),
                            SizedBox(width: 8),
                            Text(
                              "Tambah Periode",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              const SizedBox(height: 16),
              XButton(
                width: MediaQuery.of(context).size.width,
                backgroundColor: XAppColors.primaryColors,
                onPressed: () {
                  _showPickerOptions(context);
                },
                title: "Upload Photo",
                child: Row(
                  children: const [
                    Icon(Icons.camera_alt_rounded),
                    SizedBox(width: 8),
                    Text(
                      "Upload Photo",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Builder(builder: (context) {
                return XButton(
                  width: MediaQuery.of(context).size.width,
                  backgroundColor:
                      (valid_form) ? XAppColors.green : Colors.grey[500],
                  onPressed: () {
                    if (widget.data_edit == null) {
                      simpanBaru(context);
                    } else {
                      simpanEdit(context);
                    }
                  },
                  busy: loading,
                  enabled: valid_form && loading == false,
                  title: "Simpan Promo",
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget periodeCard(PromoPeriode value, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: const Color(0xffF6F8FA),
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
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
                height: 155,
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
                  flex: 6,
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
                            child: const Center(
                              child: Icon(
                                Icons.watch_later,
                                size: 16,
                                color: XAppColors.green,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Periode ${index + 1}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    value.periode ?? "",
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
                          Builder(builder: (context) {
                            return SizedBox(
                              height: 35,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => EditPeriodePromosi(
                                              value,
                                              edit_langsung:
                                                  (widget.data_edit != null),
                                              id_promo:
                                                  (widget.data_edit != null)
                                                      ? widget.data_edit!.id
                                                      : null,
                                            )).then((value) {
                                      if (value != null) {
                                        refresh(context);
                                        validasi_form();
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color(0xffDA7144),
                                    size: 16,
                                  )),
                            );
                          }),
                          Builder(builder: (context) {
                            return SizedBox(
                              height: 35,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {
                                    if (widget.data_edit != null) {
                                      showLoading(context,
                                          message: "Menghapus data...");
                                      BlocProvider.of<PromoPeriodeBloc>(context)
                                          .add(PromoPeriodeEvent
                                              .deletePromoPeriode(
                                                  value.id.toString()));
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color(0xffE76161),
                                    size: 16,
                                  )),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Keterangan Promo",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value.keterangan ?? "",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Harga Normal",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              config()
                                  .format_rupiah(value.hargaNormal.toString())!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: XAppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Harga Promo",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              config()
                                  .format_rupiah(value.hargaPromo.toString())!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: XAppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void validasi_form() {
    if (namaController.text.isNotEmpty) {
      if (hargaController.text.isNotEmpty) {
        valid_form = true;
      } else {
        valid_form = false;
      }
    } else {
      valid_form = false;
    }
    setState(() {});
  }

  void _showPickerOptions(BuildContext context) {
    hideKeyboard(context);
    XBottomSelectOption.show(
      items: [
        XBottomSelectOptionItem(
          icon: Icons.camera_alt,
          label: "Ambil dari Camera",
          onTap: () => _getImage(source: ImageSource.camera),
        ),
        XBottomSelectOptionItem(
          icon: Icons.image,
          label: "Upload dari Galery",
          onTap: () => _getImage(source: ImageSource.gallery),
        ),
      ],
    );
  }

  Future<void> _getImage({required ImageSource source}) async {
    try {
      pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        final File? croppedFile = await _cropPhoto(pickedFile!);
        if (croppedFile != null) {
          setState(() {
            pickedFile = XFile(croppedFile.path);
            validasi_form();
          });
        }
      }
    } on PlatformException catch (_) {
      FlashMessage.error(context: context);
    } catch (e) {
      XToast.show(e.toString());
    }
  }

  Future<File?> _cropPhoto(XFile pickedFile) async {
    final result = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: S.text.adjust_image,
          toolbarColor: XAppColors.primary,
          activeControlsWidgetColor: XAppColors.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        )
      ],
    );

    return result != null ? File(result.path) : null;
  }

  void refresh(BuildContext context) {
    BlocProvider.of<PromoPeriodeBloc>(context).add(
        PromoPeriodeEvent.getPromoPeriode(
            {"id_promo": widget.data_edit!.id.toString()}));
  }

  simpanBaru(BuildContext context, [bool mounted = true]) async {
    setState(() {
      loading = true;
    });
    var formData = FormData.fromMap({
      'nama_promosi': namaController.text,
      'harga': hargaController.text,
      'id_outlet': widget.id_outlet.toString(),
      'image': (pickedFile != null)
          ? await MultipartFile.fromFile(pickedFile!.path)
          : '',
    });

    if (mounted) {
      BlocProvider.of<PromoCompetitorBloc>(context)
          .add(PromoCompetitorEvent.addPromoCompetitor(formData));
    }
  }

  simpanEdit(BuildContext context, [bool mounted = true]) async {
    setState(() {
      loading = true;
    });
    Map<String, dynamic> params = <String, dynamic>{};
    params['nama_promosi'] = namaController.text;
    params['harga'] = hargaController.text;
    params['id_outlet'] = widget.id_outlet.toString();
    if (pickedFile != null) {
      params['image'] = await MultipartFile.fromFile(pickedFile!.path);
    }
    params['id'] = widget.data_edit!.id.toString();
    var formData = FormData.fromMap(params);
    if (mounted) {
      BlocProvider.of<PromoCompetitorBloc>(context)
          .add(PromoCompetitorEvent.updatePromoCompetitor(formData));
    }
  }
}
