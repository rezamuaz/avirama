import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/features/aktifitas_sales/detail_aktifitas.dart';
import 'package:absensi_app/src/features/aktifitas_sales/pilih_sales.dart';
import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/date_picker.dart';
import 'package:absensi_app/src/utils/date_range_picker.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/forms/input_get_location.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaftarAktifitasView extends StatefulWidget {
  const DaftarAktifitasView({Key? key}) : super(key: key);

  @override
  State<DaftarAktifitasView> createState() => _DaftarAktifitasViewState();
}

class _DaftarAktifitasViewState extends State<DaftarAktifitasView> {
  bool loading = false;
  List salesList = [];
  Map? salesTerpilih;
  String? tanggal_awal;
  // String? tanggal_akhir;
  String? range;
  Map dataUser = {};
  List absensiList = [];
  List kunjunganList = [];
  List produk_outletList = [];
  List promosi_kompetitorList = [];
  List kompetitorList = [];
  Outlet? initialData;

  @override
  initState() {
    tanggal_awal = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // tanggal_akhir = DateFormat("yyyy-MM-dd").format(DateTime.now());
    range = DateFormat("yyyy/MM/dd").format(DateTime.now());
    // " - " +
    // DateFormat("yyyy/MM/dd").format(DateTime.now());
    getTeam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daftar AKtifitas',
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Select Team",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (con) => PilihSales(salesList))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            salesTerpilih = value;
                          });
                          getData();
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              (salesTerpilih == null)
                                  ? "Select Team"
                                  : salesTerpilih!['name'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 22,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (con) => DatePicker(
                                tanggal_awal: tanggal_awal,
                              )).then((value) {
                        if (value != null) {
                          setState(() {
                            tanggal_awal = value;
                          });
                          getData();
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            size: 22,
                            color: XAppColors.grey,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              tanggal_awal!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            (loading == false)
                ? (absensiList.isNotEmpty)
                    ? Expanded(
                        child: Container(
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            InputGetLocation(
                              initialData: initialData,
                              onLocationChanged: _onLocationChanged,
                            ),
                            const SizedBox(height: 16),
                            for (int i = 0; i < absensiList.length; i++)
                              absenCard(i),
                            for (int i = 0; i < kunjunganList.length; i++)
                              kunjunganCard(i),
                            for (int i = 0; i < produk_outletList.length; i++)
                              produkCard(i),
                          ],
                        )),
                      ))
                    : Kosong()
                : Expanded(child: LoadingForm(context, loading)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (con) => DetailAktifitas(
                      tgl: tanggal_awal,
                      absensiList: absensiList,
                      dataUser: dataUser,
                      kunjunganList: kunjunganList,
                      produk_outletList: produk_outletList,
                    ));
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: XAppColors.green,
            ),
            child: const Center(
              child: Text(
                "Detail Aktifitas",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget absenCard(int index) {
    Map obj_absen = absensiList[index];
    String outlet = "-";
    if (obj_absen['store'] != null) {
      outlet = obj_absen['store']['name'] ?? "-";
    }
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 5,
              decoration: const BoxDecoration(
                  color: XAppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const SizedBox(width: 8),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xffFDE5D4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/ic_alarm.png",
                  height: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            dataUser['name'] ?? "-",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.Hm(
                            "ID",
                          )
                              .format(DateTime.parse(obj_absen['created_at']))
                              .toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: XAppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 14),
                      ],
                    ),
                    Text(
                      'Lakukan Absensi di Outlet $outlet',
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
          ],
        ),
      ),
    );
  }

  Widget kunjunganCard(int index) {
    Map objKunjungan = kunjunganList[index];
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 5,
              decoration: const BoxDecoration(
                  color: XAppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const SizedBox(width: 8),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xffD4FDD8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/ic_calender.png",
                  height: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            dataUser['name'] ?? "-",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.Hm(
                            "ID",
                          )
                              .format(
                                  DateTime.parse(objKunjungan['created_at']))
                              .toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: XAppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 14),
                      ],
                    ),
                    const Text(
                      'Tambah Jadwal Pertemuan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: XAppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget produkCard(int index) {
    Map obj_produk = produk_outletList[index];
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 5,
              decoration: const BoxDecoration(
                  color: XAppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const SizedBox(width: 8),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xffD4E2FD),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/ic_add.png",
                  height: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            dataUser['name'] ?? "-",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.Hm(
                            "ID",
                          )
                              .format(DateTime.parse(obj_produk['created_at']))
                              .toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: XAppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 14),
                      ],
                    ),
                    const Text(
                      'Tambah Data Produk Baru',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: XAppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Kosong() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ic_kosong.png",
                height: 182,
              ),
              const SizedBox(height: 42),
              Text(
                'Data Kosong',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: XAppColors.primaryColors,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tidak ada data yang ditampilkan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getTeam() {
    Api().getUserByTL().then((value) {
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response.containsKey('data')) {
            salesList = response['data'];
          }
        }
      }
      setState(() {});
    });
  }

  void getData() {
    if (salesTerpilih != null) {
      setState(() {
        loading = true;
      });
      Map<String, String> params = <String, String>{};
      params['start_date'] = "${tanggal_awal!} 00:00:00";
      params['end_date'] = "${tanggal_awal!} 23:59:59";
      params['id_user'] = salesTerpilih!['id'].toString();
      Api().getDetailAktifitas(params).then((value) {
        loading = false;
        if (value != null) {
          if (config.isJsonValid(value)) {
            var response = jsonDecode(value);
            dataUser = response['user'];
            absensiList = response['absensi'];
            kunjunganList = response['kunjungan'];
            produk_outletList = response['produk_outlet'];
            promosi_kompetitorList = response['promosi_kompetitor'];
            kompetitorList = response['kompetitor'];
            if (absensiList.isNotEmpty) {
              initialData = Outlet(
                  id: int.tryParse(absensiList[0]['store_id']) ?? 0,
                  name: (absensiList[0]['store'] != null)
                      ? absensiList[0]['store']['name']
                      : "-",
                  address: (absensiList[0]['store'] != null)
                      ? absensiList[0]['store']['address']
                      : "-",
                  long: absensiList[0]['lang_int'],
                  lang: absensiList[0]['long_int'],
                  radius: "200");
            }
          }
        }
        setState(() {});
      });
    }
  }

  void _onLocationChanged(double? lat, double? lon, String? radius) {
    print('onLocationChanged $lat $lon $radius');
  }
}
