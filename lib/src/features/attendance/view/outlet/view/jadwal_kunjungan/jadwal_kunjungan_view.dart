import 'dart:convert';
import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/jadwal_kunjungan/detail_jadwal_kunjungan.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/jadwal_kunjungan/tambah_jadwal_kunjungan.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class JadwalKunjunganView extends StatefulWidget {
  const JadwalKunjunganView({Key? key}) : super(key: key);

  @override
  State<JadwalKunjunganView> createState() => _JadwalKunjunganViewState();
}

class _JadwalKunjunganViewState extends State<JadwalKunjunganView> {
  DateRangePickerController tanggalController = DateRangePickerController();
  String tanggal = "";
  DateTime? mydate;
  bool loading = true;
  List dataJadwalList = [];

  @override
  initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading == false)
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  header_form(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: XAppColors.green),
                      ),
                      child: SfDateRangePicker(
                        controller: tanggalController,
                        onSelectionChanged: onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.single,
                        selectionColor: XAppColors.green,
                        endRangeSelectionColor: XAppColors.green,
                        backgroundColor: Colors.white,
                        rangeSelectionColor: XAppColors.greenMuda,
                        startRangeSelectionColor: XAppColors.green,
                        todayHighlightColor: XAppColors.green,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: dataJadwalList.length,
                        itemBuilder: (context, index) =>
                            jadwalCard(dataJadwalList[index])),
                  )
                  // for (int i = 0; i < dataJadwalList.length; i++) jadwalCard(i),
                ],
              ),
            )
          : LoadingForm(context, loading),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TambahJadwalKunjungan()))
              .then((value) {
            if (value != null && value == true) {
              getData();
            }
          });
        },
        backgroundColor: XAppColors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget header_form() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      color: Colors.grey[100],
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              color: XAppColors.primaryColors,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 8),
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 18,
                      )),
                  const Expanded(
                    child: Text(
                      'Jadwal Kunjungan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 90,
              right: 0,
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   flex: 4,
                      //   child: Container(
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: <Widget>[
                      //         Text("Kunjungan Bulan ini",
                      //             style: TextStyle(
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 12,
                      //               color: XAppColors.grey,
                      //             )),
                      //         Text(
                      //           "10",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 14,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 24,
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text("Total Kunjungan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: XAppColors.grey,
                                )),
                            Text(
                              dataJadwalList.length.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget jadwalCard(Map data) {
    // Map data = dataJadwalList[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (con) => DetailJadwalKunjungan(data)).then((value) {
            if (value != null && value == true) {
              getData();
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: XAppColors.green),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 5,
                decoration: const BoxDecoration(
                    color: XAppColors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    )),
              ),
              const SizedBox(width: 8),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: XAppColors.greenMuda,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/ic_outlet.png",
                    height: 16,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['outlet'] ?? ""}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${data['date'] ?? ""}',
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
      ),
    );
  }

  void initData() {
    mydate ??= DateTime.now();
    getData();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value != null) {
      mydate = args.value;
    }
    setState(() {});
    showLoading(context, message: "Sedang mengambil data...");
    getData();
  }

  void getData() {
    Map params = {};
    // params['start_date'] =
    //     "${DateFormat("yyyy-MM-dd").format(mydate!)} 00:00:00";
    // params['end_date'] = "${DateFormat("yyyy-MM-dd").format(mydate!)} 23:59:59";
    // print("${DateFormat("yyyy-MM-dd").format(mydate!)} 00:00:00");
    // print("${DateFormat("yyyy-MM-dd").format(mydate!)} 23:59:59");
    Api().getJadwalKunjungan(params).then((value) {
      hideLoading();
      setState(() {
        loading = false;
      });
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response.containsKey('data')) {
            dataJadwalList = response['data'];
            setState(() {});
          } else {
            FlashMessage.error(
                context: context,
                title: "Gagal mengambil jadwal kunjungan",
                message: response['message'].toString());
          }
        } else {
          FlashMessage.error(
              context: context,
              title: "Gagal mengambil jadwal kunjungan",
              message: "Silahkan cek koneksi internet Anda !");
        }
      } else {
        FlashMessage.error(
            context: context,
            title: "Gagal mengambil jadwal kunjungan",
            message: "Silahkan cek koneksi internet Anda !");
      }
    });
  }
}
