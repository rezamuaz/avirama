import 'dart:convert';

import 'package:absensi_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as Math;

class config {
  static String title_app = "Avirama Absensi";
  static String version_app = "ver.1.0.0";
  static int version_code = 1;
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'id_ID', name: 'Rp ', decimalDigits: 2);
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  static bool isJsonValid(String json_value) {
    try {
      if (json_value == null) {
        return false;
      } else if (json_value.isNotEmpty) {
        if (json_value == "" || json_value == "null" || json_value == '""') {
          return false;
        } else {
          var json_produk = jsonDecode(json_value);
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<String?> getToken() async {
    Auth auth = Auth.instance;
    if (auth.isLoggedIn) {
      return auth.token;
    } else {
      return "";
    }
  }

  Future<dynamic> getSharefpref(String key,
      {bool? getString, bool? getInt, bool? getDouble, bool? getBool}) async {
    final prefs = await SharedPreferences.getInstance();
    if (getString != null && getString == true) {
      return prefs.getString(key);
    } else if (getInt != null && getInt == true) {
      return prefs.getInt(key);
    } else if (getDouble != null && getDouble == true) {
      return prefs.getDouble(key);
    } else if (getBool != null && getBool == true) {
      return prefs.getBool(key);
    } else {
      return prefs.getString(key);
    }
  }

  Future<void> setSharefpref_byKey(String keys,
      {String? setString,
      int? setInt,
      double? setDouble,
      bool? setBool}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (setString != null) {
        prefs.setString(keys, setString);
      } else if (setInt != null) {
        prefs.setInt(keys, setInt);
      } else if (setBool != null) {
        prefs.setBool(keys, setBool);
      } else if (setDouble != null) {
        prefs.setDouble(keys, setDouble);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> remove_sharedpref(String keys) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove(keys);
      return true;
    } catch (e) {
      return false;
    }
  }

  String? format_rupiah(String? uang_input) {
    try {
      String uang_rupiah = "0";
      double convert = convert_rupiah(uang_input!);
      uang_rupiah = formatCurrency.format(convert).replaceAll(",00", "");
      return uang_rupiah;
    } catch (e, s) {
      print(e);
    }
  }

  double convert_rupiah(String uang_input) {
    if (uang_input.toLowerCase().contains("rp")) {
      try {
        uang_input = formatCurrency.parse(uang_input).toString();
      } catch (e) {
        uang_input.replaceAll(
            uang_input.substring(uang_input.length - 1), ".0");
      }
    } else {
      if (uang_input.contains(".0")) {
        if (uang_input.substring(uang_input.length - 2, uang_input.length) ==
            ".0") {
          uang_input = uang_input.replaceAll(".0", "");
        }
      }
    }
    var jumlah_uang = double.tryParse('$uang_input') ?? 0;
    assert(jumlah_uang is double);
    return jumlah_uang;
  }

  Future<bool> handlePermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  double deg2rad(deg) {
    return deg * (Math.pi / 180);
  }
}
