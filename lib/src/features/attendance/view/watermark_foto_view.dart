import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class WaterMarkFotoView extends StatefulWidget {
  final String? imagePath;
  final String? outlet;
  final String? judul;

  const WaterMarkFotoView(this.imagePath, this.outlet, this.judul, {super.key});

  @override
  State<WaterMarkFotoView> createState() => _WaterMarkFotoViewState();
}

class _WaterMarkFotoViewState extends State<WaterMarkFotoView> {
  GlobalKey _globalKey = GlobalKey();
  String address = "";

  @override
  initState() {
    super.initState();
    _getCurrentLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Preview Image',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 0,
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
      body: SizedBox(
        child: RepaintBoundary(
          key: _globalKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(widget.imagePath!)),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "(${widget.judul})",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(flex: 2, child: SizedBox()),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Lokasi : ${widget.outlet}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "(${DateFormat("dd MMM yyyy HH:mm:ss", 'ID').format(DateTime.now())})",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                (address.isNotEmpty) ? address : "Loading...",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GestureDetector(
            onTap: () {
              if (address.isNotEmpty) {
                _capturePng();
              }
            },
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (address.isNotEmpty)
                    ? XAppColors.primary
                    : Colors.grey[500],
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  (address.isNotEmpty) ? "Simpan Gambar" : "Loading...",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Position?> _getCurrentLocation(BuildContext context) async {
    showLoading(context, message: "Sedang memproses data...");
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        FlashMessage.error(
          context: context,
          message:
              "Kamu Harus Mengijinkan akses Lokasi Untuk Menggunakan Fitur ini",
        );
        return Future.error('Location permission denied');
      }
    }
    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      FlashMessage.error(
        context: context,
        message: "Location permission denied forever, we cannot access",
      );
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }

    //getCurrentLocation
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    List<Placemark> data = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final place = data.first;
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    hideLoading();
    setState(() {});
    return position;
  }

  Future<void> _capturePng() async {
    try {
      showLoading(context, message: "Sedang memproses gambar...");
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 1.2);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      File file = File(widget.imagePath!);
      file.writeAsBytesSync(pngBytes);
      GallerySaver.saveImage(file.path);
      hideLoading();
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      print(e);
      XToast.show(e.toString());
      hideLoading();
    }
  }
}
