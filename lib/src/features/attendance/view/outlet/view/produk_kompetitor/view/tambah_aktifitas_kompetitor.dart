import 'dart:convert';
import 'dart:io';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_act_bloc.dart';
import 'package:absensi_app/src/localization/localization_utils.dart';
import 'package:absensi_app/src/network/data/common/http.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/bottom_select_option.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class TambahAktifitasKompetitor extends StatefulWidget {
  int id_outlet;

  TambahAktifitasKompetitor(this.id_outlet, {super.key});

  @override
  State<TambahAktifitasKompetitor> createState() =>
      _TambahAktifitasKompetitorState();
}

class _TambahAktifitasKompetitorState extends State<TambahAktifitasKompetitor> {
  TextEditingController namaController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  bool loading = false;
  XFile? pickedFile;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompetitorActBloc>(
      create: (context) => CompetitorActBloc(),
      child: Builder(builder: (context) {
        return BlocListener<CompetitorActBloc, CompetitorActState>(
          listener: (context, state) {
            state.whenOrNull(
              addedCompetitorActivity: (data) {
                loading = false;
                XToast.show("Aktifitas Kompetitor berhasil di tambahkan");
                Navigator.pop(context, true);
              },
              isError: (networkExceptions) {
                FlashMessage.error(
                    context: context,
                    title: "Aktifitas Kompetitor gagal di tambahkan");
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
                        'Tambah Aktifitas Kompetitor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 16)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: namaController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Nama Aktifitas",
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
                    // Padding(
                    //   padding: (EdgeInsets.symmetric(horizontal: 16)),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: TextFormField(
                    //       controller: keteranganController,
                    //       keyboardType: TextInputType.text,
                    //       decoration: InputDecoration(
                    //         hintText: "Keterangan",
                    //         hintStyle: TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w400,
                    //           color: XAppColors.grey,
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10.0),
                    //           borderSide: BorderSide(
                    //             color: XAppColors.grey,
                    //           ),
                    //         ),
                    //         prefixIcon: Icon(
                    //           Icons.list,
                    //           color: XAppColors.grey,
                    //           size: 18,
                    //         ),
                    //         contentPadding: EdgeInsets.only(
                    //             left: 15, bottom: 5, top: 5, right: 15),
                    //       ),
                    //       readOnly: false,
                    //     ),
                    //   ),
                    // ),
                    if (pickedFile != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Image.file(
                          File(pickedFile!.path),
                          width: 96,
                          height: 96,
                        ),
                      ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: XButton(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: XButton(
                        title: "Simpan",
                        onPressed: () {
                          if (namaController.text.isNotEmpty) {
                            simpanData(context);
                          } else {
                            XToast.show("Nama aktifitas belum diisi");
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        enabled: !loading,
                        busy: loading,
                        backgroundColor: XAppColors.green,
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

  Future<void> simpanData(BuildContext context, [bool mounted = true]) async {
    setState(() {
      loading = true;
    });
    var formData = FormData.fromMap({
      'keterangan': namaController.text,
      'id_outlet': widget.id_outlet.toString(),
      'image': (pickedFile != null)
          ? await MultipartFile.fromFile(pickedFile!.path)
          : '',
    });
    if (mounted) {
      BlocProvider.of<CompetitorActBloc>(context)
          .add(CompetitorActEvent.addCompetitorActivity(formData));
    }
  }
}
