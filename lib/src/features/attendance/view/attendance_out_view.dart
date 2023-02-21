import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show cos, sqrt, asin;
import 'package:absensi_app/gen/assets.gen.dart';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/widget/outlet_maps.dart';
import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:absensi_app/src/router/auto_router.gr.dart';
import 'package:absensi_app/src/router/coordinator.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/common/back_button.dart';
import '../../../../widgets/common/bottom_select_option.dart';
import '../../../localization/localization_utils.dart';
import 'dart:ui' as ui;

class AttendanceOutView extends StatefulWidget {
  const AttendanceOutView({super.key, required this.outlet});
  final Outlet outlet;

  @override
  State<AttendanceOutView> createState() => _AttendanceOutViewState();
}

class _AttendanceOutViewState extends State<AttendanceOutView> {
  final _noteController = TextEditingController();
  bool isGetInRange = false;
  Position? position;
  bool toogleRefresh = false;
  final _picker = ImagePicker();
  String? imagePath;
  XFile? pickedFile;

  // -7.3559213,108.187251,17.25
  double lat = -7.3559213;
  double lon = 108.187251;

  // -7.356992,108.1843686
  double latStore = -7.3398585;
  double lonStore = 108.2450203;

  String? radius;
  String? address;
  bool refreshMapsOnlyOnce = false;
  Timer? timerRefreshLocation;
  Timer? timerRefresh;
  GlobalKey _globalKey = GlobalKey();

  void _timer() {
    timerRefresh = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (toogleRefresh) {
          toogleRefresh = false;
          setState(() {});
        }
      },
    );

    Future.delayed(const Duration(seconds: 5)).then((value) {
      toogleRefresh = true;
    });
  }

  Future<void> _getAddress() async {
    var location = await _getCurrentLocation();
    List<Placemark> data = await placemarkFromCoordinates(
      lat,
      lon,
    );
    final place = data.first;
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    _calculateDistance(lat, lon, latStore, lonStore);
  }

  void _calculateDistance(lat1, lon1, lat2, lon2) {
    // print("lat device : $lat1");
    // print("lat outlet : $lat2");
    // print("long device : $lon1");
    // print("long outlet : $lon2");
    double distanceInMeters =
        Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
    var p = 0.017453292519943295;
    // double radiusInRange = (double.parse(radius ?? '200') * 0.001);
    double radiusInRange = double.parse(radius ?? '200');
    /*var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    final distanceKm = 12742 * asin(sqrt(a));*/

    if (distanceInMeters <= radiusInRange) {
      isGetInRange = true;
    } else {
      isGetInRange = false;
    }
    // log('range? $isGetInRange $distanceKm  $radiusInRange');
  }

  Future<Position?> _getCurrentLocation() async {
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
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    lat = position!.latitude;
    lon = position!.longitude;
    log('location refresh $lat /$lon');
    return position;
  }

  void _refresh() {
    log('refresh');
    toogleRefresh = true;
  }

  void _showPickerOptions(BuildContext context) {
    if (!isGetInRange) return;
    hideKeyboard(context);
    XBottomSelectOption.show(
      items: [
        XBottomSelectOptionItem(
          icon: Icons.camera_alt,
          label: S.text.camera,
          onTap: () => _getImage(source: ImageSource.camera),
        ),
      ],
    );
  }

  Future<File?> _cropPhoto(XFile pickedFile) async {
    final result = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio4x3,
      ],
      compressQuality: 85,
      aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
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

  void _onButtonConfirmPress(String photoPath) {
    log('confirmed');
    toogleRefresh = true;
    setState(() {
      imagePath = photoPath;
    });
  }

  Future<void> _getImage({required ImageSource source}) async {
    try {
      pickedFile = await _picker.pickImage(
          source: source,
          imageQuality: 85,
          maxWidth: 700,
          maxHeight: 700,
          preferredCameraDevice: CameraDevice.front);
      if (pickedFile != null) {
        final File? croppedFile = await _cropPhoto(pickedFile!);
        if (croppedFile != null) {
          if (mounted) {
            _onButtonConfirmPress(croppedFile.path);
          }
        }
      }
    } on PlatformException catch (_) {
      FlashMessage.error(context: context);
    } catch (e) {
      XToast.show(e.toString());
    }
  }

  void _goToView(PageRouteInfo<dynamic> route) {
    XCoordinator.rootRouter.replace(route);
  }

  Future<void> _onAttendanceOutPressed() async {
    bool proses_image = await _capturePng();
    if (imagePath == null) return;
    _goToView(AttendanceOutDoneRoute(
        item: widget.outlet,
        path: imagePath!,
        lang: lat.toString(),
        long: lon.toString(),
        note: _noteController.text));
  }

  Future<bool> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 1.3);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      File file = File(imagePath!);
      file.writeAsBytesSync(pngBytes);
      GallerySaver.saveImage(file.path);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    timerRefresh!.cancel();
  }

  @override
  void initState() {
    super.initState();
    latStore = double.tryParse(widget.outlet.long!) ?? -7.3559213;
    lonStore = double.tryParse(widget.outlet.lang!) ?? 108.187251;
    _timer();
    setState(() {
      radius = widget.outlet.radius;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('rebuild');
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          'Absensi Keluar',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: XAppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            child: Row(
              children: [
                Assets.svgs.adress.svg(height: 30),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Anda',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      FutureBuilder(
                        future: _getAddress(),
                        builder: (context, snapshot) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                address ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                maxLines: 4,
                                minFontSize: 3,
                              ),
                              AutoSizeText(
                                '${lat.toStringAsFixed(4)}, ${lon.toStringAsFixed(4)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                minFontSize: Constants.kFontSizeXS,
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: _getCurrentLocation(),
              builder: (context, AsyncSnapshot<Position?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SimpleMap(
                  lat: snapshot.data!.latitude,
                  lon: snapshot.data!.longitude,
                  radius: radius ?? '200',
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
            child: Column(
              children: [
                const SizedBox(height: Constants.kPaddingXL),
                Container(
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svgs.outletIcon.svg(height: 40),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.outlet.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black87),
                            ),
                            const SizedBox(width: 3),
                            AutoSizeText(
                              widget.outlet.address,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 5,
                              textAlign: TextAlign.start,
                              minFontSize: Constants.kFontSizeXS,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Constants.kPaddingL),
                const Divider(color: Colors.grey, height: 2),
                const SizedBox(height: Constants.kPaddingS),
                isGetInRange
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Anda sudah masuk dalam jangkauan absensi',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.not_interested,
                            color: Colors.red,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Anda Belum masuk dalam jangkauan absensi',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: Constants.kPaddingL),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Catatan (opsional)'),
                ),
                const SizedBox(height: Constants.kPaddingM),
                XInputCustom(
                  readOnly: isGetInRange ? false : true,
                  labelText: 'Catatan',
                  prefixIcon: Icons.edit,
                  controller: _noteController,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: Constants.kPaddingM),
                pickedFile != null ? ViewImage() : Container(),
                const SizedBox(height: Constants.kPaddingM),
                XButton(
                  onPressed: () {
                    _showPickerOptions(context);
                  },
                  backgroundColor: isGetInRange
                      ? XAppColors.primaryLight
                      : XAppColors.primaryLight.withOpacity(0.5),
                  child: Row(
                    children: [
                      const Icon(Icons.camera_alt),
                      const SizedBox(width: 5),
                      Text(
                        pickedFile == null
                            ? 'Upload Photo'
                            : 'Upload Ulang Photo',
                      )
                    ],
                  ),
                ),
                const SizedBox(height: Constants.kPaddingM),
                XButton(
                  onPressed: _onAttendanceOutPressed,
                  backgroundColor:
                      pickedFile != null ? Colors.green : Colors.green.shade100,
                  child: const Text('Lakukan Absensi Keluar'),
                ),
                const SizedBox(height: Constants.kPaddingS),
                const AutoSizeText(
                  'Segera melapor apabila anda tidak dapat melakukan absensi keluar',
                  minFontSize: 3,
                  maxLines: 1,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: Constants.kPaddingL),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ViewImage() {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        height: 360,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(imagePath!)),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "(ABSEN KELUAR)",
                  style: TextStyle(
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
                            "Lokasi : ${widget.outlet.name}",
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
                            "$address",
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
    );
  }
}
