// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/widgets/common/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../src/features/attendance/view/outlet/widget/outlet_maps.dart';
import '../../src/network/model/outlet/outlet.dart';

class InputGetLocation extends StatefulWidget {
  InputGetLocation({
    super.key,
    required this.initialData,
    required this.onLocationChanged,
  });
  final Outlet? initialData;
  final Function(double?, double?, String?) onLocationChanged;
  @override
  State<InputGetLocation> createState() => InputGetLocationState();
}

class InputGetLocationState extends State<InputGetLocation> {
  bool isLoading = true;
  Position? position;
  late double lat;
  late double lon;
  late String radius;
  Future<void> initLocation() async {
    //get location from api
    if (widget.initialData != null) {
      lat = double.tryParse(widget.initialData!.long!) ?? 0;
      lon = double.tryParse(widget.initialData!.lang!) ?? 0;
      radius = widget.initialData!.radius!;
      setState(
        () {
          isLoading = false;
        },
      );
    } else {
      //get location from current location
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
          XBottomSheet.hide();
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
        XBottomSheet.hide();
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
        desiredAccuracy: LocationAccuracy.high,
      );
      lat = position!.latitude;
      lon = position!.longitude;
      radius = "200";
      widget.onLocationChanged(lat, lon, radius);
    }
    setState(
      () {
        isLoading = false;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return SimpleMap(
      lat: lat,
      lon: lon,
      radius: radius,
    );
  }
}
