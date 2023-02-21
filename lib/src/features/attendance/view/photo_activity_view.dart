import 'dart:convert';
import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/date_range_picker.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhotoActivityView extends StatefulWidget {
  const PhotoActivityView({Key? key}) : super(key: key);

  @override
  State<PhotoActivityView> createState() => _PhotoActivityViewState();
}

class _PhotoActivityViewState extends State<PhotoActivityView> {
  bool loading = true;
  List dataList = [];
  String? tanggal_awal;
  String? tanggal_akhir;
  String? range;

  @override
  initState() {
    super.initState();
    tanggal_awal = DateFormat("yyyy-MM-dd").format(DateTime.now());
    tanggal_akhir = DateFormat("yyyy-MM-dd").format(DateTime.now());
    range =
        "${DateFormat("yyyy/MM/dd").format(DateTime.now())} - ${DateFormat("yyyy/MM/dd").format(DateTime.now())}";
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Photo Activity',
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
      body: (loading == false)
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (con) => DateRangePicker(
                                tanggal_awal: tanggal_awal,
                                tanggal_akhir: tanggal_akhir,
                                range: range,
                              )).then((value) {
                        if (value != null) {
                          tanggal_awal = value['tanggal_awal'];
                          tanggal_akhir = value['tanggal_akhir'];
                          range = value['range'];
                          setState(() {
                            loading = true;
                          });
                          getData();
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: XAppColors.green),
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
                              range!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  (dataList.isNotEmpty)
                      ? Expanded(
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (int i = 0; i < dataList.length; i++)
                                    photoCard(i),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Kosong(),
                ],
              ),
            )
          : LoadingForm(context, loading),
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
                'Silahkan pilih tanggal laporan',
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

  Widget photoCard(int index) {
    String url = "";
    String tgl = dataList[index]['date'] ?? "-";
    String jam = "";
    if (dataList[index]['check_out'] != null) {
      url = dataList[index]['photo_out'] ?? "";
      jam = dataList[index]['check_out'] ?? "";
    } else {
      url = dataList[index]['photo_in'] ?? "";
      jam = dataList[index]['check_int'] ?? "";
    }
    String user_profil = dataList[index]['user_profil'] ?? "";
    String user = dataList[index]['user'] ?? "-";
    String outlet = dataList[index]['outlet'] ?? "-";
    String alamat = (dataList[index]['data_outlet'] != null)
        ? dataList[index]['data_outlet']['address'] ?? "-"
        : "-";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: XCacheNetworkImage(
              imageUrl: Api.Url_image + url,
              size: Size(MediaQuery.of(context).size.width, 100),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: XAppColors.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    alamat,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: XAppColors.greenAccent,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          tgl,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: XAppColors.orange,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.watch_later,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          jam,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: XCacheNetworkImage(
                  imageUrl: user_profil,
                  size: const Size(32, 32),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Lakukan Absensi ${dataList[index]['check_out'] != null ? "masuk" : "keluar"} di Outlet $outlet',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: XAppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getData() {
    Map<String, String> params = <String, String>{};
    params['start_date'] = "${tanggal_awal!} 00:00:00";
    params['end_date'] = "${tanggal_akhir!} 23:59:59";
    Api().getPhotoActivity(params).then((value) {
      loading = false;
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response.containsKey('data')) {
            dataList = response['data'];
          }
        }
      }
      setState(() {});
    });
  }
}
