import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:absensi_app/config.dart';

class Api {
  Client client = Client();
  // static const String Base_Url = "http://10.0.2.2:8000/api/";
  // static const String Base_Url = "http://192.168.43.202:8000/api/";
  // static const String Base_Url = "http://127.0.0.1:8000/api/";
  static const String Base_Url =
      "https://aviramastag.zenmultimediacorp.com/api";
  // static const String Base_Url = "http://deso.my.id:280/api/";

  //ANCHOR - kompetitor
  static const String Url_produk_kompetitor = "produk-kompetitor";
  static const String Url_produk_kompetitor_all = "produk-kompetitor/all";
  static const String Url_produk_kompetitor_search = "produk-kompetitor/search";
  static const String Url_produk_kompetitor_update = "produk-kompetitor/update";

  //ANCHOR - aktifitas kompetitor
  static const String Url_aktifitas_kompetitor = "aktifitas-kompetitor";
  static const String Url_aktifitas_kompetitor_all = "aktifitas-kompetitor/all";

  //ANCHOR - promosi kompetitor
  static const String Url_promosi_kompetitor = "promosi-kompetitor";
  static const String Url_promosi_kompetitor_all = "promosi-kompetitor/all";
  static const String Url_promosi_kompetitor_update =
      "promosi-kompetitor/update";
  static const String Url_promosi_kompetitor_detail =
      "promosi-kompetitor/detail";
  static const String Url_promosi_kompetitor_search =
      "promosi-kompetitor/search";

  //ANCHOR - periode promosi
  static const String Url_periode_promosi = "periode-promosi";
  static const String Url_periode_promosi_update = "periode-promosi/update";
  static const String Url_periode_promosi_all = "periode-promosi/all";

  //ANCHOR -kunjungan
  static const String Url_jadwal_kunjungan = "/jadwal-kunjungan";
  static const String Url_jadwal_kunjungan_add = "jadwal-kunjungan/add";

  //ANCHOR -  outlet
  static const String Url_store_list = "store/list";
  static const String Url_store = "store";
  static const String Url_laporan_omset = "store/laporan_omset";

  //ANCHOR - Report
  static const String Url_report = "report";
  static const String Url_report_pengguna = "report/pengguna";

  //ANCHOR - absensi
  static const String Url_photoActivity = "attendance/photoActivity";
  static const String Url_user_by_tl = "activity/user-by-tl";
  static const String Url_detail_aktifitas = "attendance/detail-aktifitas-user";
  //ANCHOR -  image
  static String Url_image = Base_Url.replaceAll("api/", "");

//TODO - Mutation Product each of Outlet
  /// You need absense masuk and enter to outlet

  Future<String?> getProdukKompetitor() async {
    try {
      print(Uri.parse(Base_Url + Url_produk_kompetitor));
      String? token = await config().getToken();
      var response = await client.get(
        Uri.parse(Base_Url + Url_produk_kompetitor),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getProdukKompetitorAll(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_produk_kompetitor_all));
      print(jsonEncode(params));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_produk_kompetitor_all),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> searchProdukKompetitor(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_produk_kompetitor_search));
      print(jsonEncode(params));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_produk_kompetitor_search),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> deleteProdukKompetitor(String id_produk) async {
    try {
      print(Uri.parse("$Base_Url$Url_produk_kompetitor/$id_produk"));
      String? token = await config().getToken();
      var response = await client.delete(
        Uri.parse("$Base_Url$Url_produk_kompetitor/$id_produk"),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getAktifitasKompetitorAll(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_aktifitas_kompetitor_all));
      print(jsonEncode(params));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_aktifitas_kompetitor_all),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getPromosiKompetitorAll(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_promosi_kompetitor_all));
      print(jsonEncode(params));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_promosi_kompetitor_all),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> searchPromosiKompetitor(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_promosi_kompetitor_search));
      print(jsonEncode(params));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_promosi_kompetitor_search),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> deletePromosiKompetitor(String id) async {
    try {
      print(Uri.parse(Base_Url + Url_promosi_kompetitor));
      String? token = await config().getToken();
      var response = await client.delete(
        Uri.parse("$Base_Url$Url_promosi_kompetitor/$id"),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> addPeriodePromosi(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_periode_promosi));
      print(params);
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_periode_promosi),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getPeriodePromosiAll(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_periode_promosi_all));
      print(jsonEncode(params));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_periode_promosi_all),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> editPeriodePromosi(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_periode_promosi_update));
      print(params);
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_periode_promosi_update),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> deletePeriodePromosi(int id) async {
    try {
      print(Uri.parse(Base_Url + Url_periode_promosi));
      String? token = await config().getToken();
      var response = await client.get(
        Uri.parse("$Base_Url$Url_periode_promosi/$id"),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getJadwalKunjungan(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_jadwal_kunjungan));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_jadwal_kunjungan),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> deleteJadwalKunjungan(int id) async {
    try {
      print(Uri.parse(Base_Url + Url_jadwal_kunjungan));
      String? token = await config().getToken();
      var response = await client.delete(
        Uri.parse("$Base_Url$Url_jadwal_kunjungan/$id"),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> addJadwalKunjungan(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_jadwal_kunjungan_add));
      print(params);
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_jadwal_kunjungan_add),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> editJadwalKunjungan(var params, int id) async {
    try {
      print(Uri.parse("$Base_Url$Url_jadwal_kunjungan/$id"));
      print(params);
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse("$Base_Url$Url_jadwal_kunjungan/$id"),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getOutlet() async {
    try {
      print(Uri.parse(Base_Url + Url_store));
      String? token = await config().getToken();
      var response = await client.get(
        Uri.parse(Base_Url + Url_store),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> addReport(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_report));
      print(params);
      String? token = await config().getToken();
      print(token);
      var response = await client.post(
        Uri.parse(Base_Url + Url_report),
        body: params,
        headers: {
          "Authorization": "Bearer ${token!}",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getReportPengguna(var params) async {
    try {
      print(Uri.parse(Base_Url + Url_report_pengguna));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_report_pengguna),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
          "Accept-Language": "en",
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getPhotoActivity(var params) async {
    try {
      print(params);
      print(Uri.parse(Base_Url + Url_photoActivity));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_photoActivity),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getDetailAktifitas(var params) async {
    try {
      print(params);
      print(Uri.parse(Base_Url + Url_detail_aktifitas));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_detail_aktifitas),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getLaporanOmset(var params) async {
    try {
      print(params);
      print(Uri.parse(Base_Url + Url_laporan_omset));
      String? token = await config().getToken();
      var response = await client.post(
        Uri.parse(Base_Url + Url_laporan_omset),
        body: jsonEncode(params),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getUserByTL() async {
    try {
      print(Uri.parse(Base_Url + Url_user_by_tl));
      String? token = await config().getToken();
      var response = await client.get(
        Uri.parse(Base_Url + Url_user_by_tl),
        headers: {
          "Authorization": "Bearer ${token!}",
          'Content-type': 'application/json',
        },
      );
      print(response.body.toString());
      String result = response.body.toString();
      if (config.isJsonValid(result)) {
        var jsonResponse = json.decode(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
