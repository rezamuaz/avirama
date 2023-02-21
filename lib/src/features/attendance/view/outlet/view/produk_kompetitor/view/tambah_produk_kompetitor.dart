import 'dart:io';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/pilih_brand.dart';
import 'package:absensi_app/src/localization/localization_utils.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_brand.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/bottom_select_option.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class TambahProdukKomptetitorView extends StatefulWidget {
  final int id_outlet;

  const TambahProdukKomptetitorView(this.id_outlet, {super.key});

  @override
  State<TambahProdukKomptetitorView> createState() =>
      _TambahProdukKomptetitorViewState();
}

class _TambahProdukKomptetitorViewState
    extends State<TambahProdukKomptetitorView> {
  TextEditingController namaController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController omsetController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  TextEditingController ukuranController = TextEditingController();
  TextEditingController volumeController = TextEditingController();
  bool loading = false;
  bool valid_form = false;
  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompetitorBloc>(
      create: (context) => CompetitorBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tambah Produk Kompetitor',
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
          return BlocConsumer<CompetitorBloc, CompetitorState>(
            listener: (context, state) {
              state.whenOrNull(
                addedCompetitor: (data) {
                  setState(() {
                    loading = false;
                  });
                  XToast.show("Produk berhasil di tambahkan");
                  Navigator.pop(context, true);
                },
                isError: (networkExceptions) {
                  FlashMessage.error(
                      context: context, title: "Produk gagal di tambahkan");
                },
              );
            },
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
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
                              "Nama Brand",
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
                                  hintText: "Nama Brand",
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
                                readOnly: true,
                                // onFieldSubmitted: (value) {
                                //   validasiForm();
                                // },
                                onTap: () {
                                  context.read<CompetitorBloc>().add(
                                      const CompetitorEvent
                                          .getCompetitorProductBrand());
                                  state.maybeWhen(
                                    orElse: () {},
                                    competitorProductBrand: (data) {
                                      return Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => PilihBrand(
                                                    data: data,
                                                    loading: state.maybeWhen(
                                                      orElse: () => true,
                                                      isLoading: () => true,
                                                      competitorProductBrand:
                                                          (data) => false,
                                                    ),
                                                  ))).then((value) {
                                        if (value != null) {
                                          KompetitorBrand brand = value;
                                          brandController.text =
                                              brand.id != null
                                                  ? brand.id.toString()
                                                  : "";
                                          namaController.text =
                                              brand.name != null
                                                  ? brand.name.toString()
                                                  : "";
                                          validasiForm();
                                        }
                                      });
                                    },
                                  );
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
                              "Harga",
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
                                  hintText: "harga",
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
                                  validasiForm();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      //Omset
                      Padding(
                        padding: (const EdgeInsets.symmetric(horizontal: 24)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Omset",
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
                                controller: omsetController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  hintText: "Omset",
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
                                  validasiForm();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      //deskripsi
                      Padding(
                        padding: (const EdgeInsets.symmetric(horizontal: 24)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Deskripsi",
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
                                controller: deskripsiController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Deskripsi",
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
                                  validasiForm();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      //kategori
                      Padding(
                        padding: (const EdgeInsets.symmetric(horizontal: 24)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Kategori",
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
                                controller: kategoriController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Kategori",
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
                                  validasiForm();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      //ukuran
                      Padding(
                        padding: (const EdgeInsets.symmetric(horizontal: 24)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Ukuran",
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
                                controller: ukuranController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Ukuran",
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
                                  validasiForm();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      //volume
                      Padding(
                        padding: (const EdgeInsets.symmetric(horizontal: 24)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Volume",
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
                                controller: volumeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Volume",
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
                                  validasiForm();
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
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      const SizedBox(height: 16),
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
              backgroundColor:
                  (valid_form) ? XAppColors.green : XAppColors.grey,
              onPressed: ([bool mounted = true]) async {
                setState(() {
                  loading = true;
                });
                var formData = FormData.fromMap({
                  // 'name': namaController.text,
                  'brand_id': brandController.text,
                  'price': hargaController.text,
                  'size': ukuranController.text,
                  'vol': volumeController.text,
                  'pack': ukuranController.text,
                  'type': kategoriController.text,
                  'cat': deskripsiController.text,
                  'promo': '0',
                  'priode': '0',
                  'omset': omsetController.text,
                  'id_outlet': widget.id_outlet.toString(),
                  'image': (pickedFile != null)
                      ? await MultipartFile.fromFile(pickedFile!.path)
                      : '',
                });
                Logger().e(formData);
                if (mounted) {
                  BlocProvider.of<CompetitorBloc>(context)
                      .add(CompetitorEvent.addCompetitor(formData));
                }
              },
              busy: loading,
              enabled: valid_form && loading == false,
              title: "Simpan Produk",
            ),
          );
        }),
      ),
    );
  }

  void validasiForm() {
    if (namaController.text.isNotEmpty) {
      if (hargaController.text.isNotEmpty) {
        if (omsetController.text.isNotEmpty) {
          if (kategoriController.text.isNotEmpty) {
            if (ukuranController.text.isNotEmpty) {
              if (volumeController.text.isNotEmpty) {
                setState(() {
                  valid_form = true;
                });
              } else {
                setState(() {
                  valid_form = false;
                });
              }
            } else {
              setState(() {
                valid_form = false;
              });
            }
          } else {
            setState(() {
              valid_form = false;
            });
          }
        } else {
          setState(() {
            valid_form = false;
          });
        }
      } else {
        setState(() {
          valid_form = false;
        });
      }
    } else {
      setState(() {
        valid_form = false;
      });
    }
  }

  Future<XFile?> testCompressFile(XFile inputFile) async {
    print('testCompressFile');
    File? file = File(inputFile.path);
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 800,
      quality: 55,
    );
    print(file.lengthSync());
    print(result?.length);
    return XFile.fromData(result!);
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
        // final XFile? compressFile = await testCompressFile(pickedFile!);
        // if (compressFile != null) {
        final File? croppedFile = await _cropPhoto(pickedFile!);
        if (croppedFile != null) {
          setState(() {
            pickedFile = XFile(croppedFile.path);
            validasiForm();
          });
          // }
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
}
