import 'dart:convert';
import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:absensi_app/src/features/laporan_omset/pilih_spg.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/form/pilih_outlet.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LaporanOmsetView extends StatefulWidget {
  const LaporanOmsetView({Key? key}) : super(key: key);

  @override
  State<LaporanOmsetView> createState() => _LaporanOmsetViewState();
}

class _LaporanOmsetViewState extends State<LaporanOmsetView> {
  Map? salesTerpilih;
  Map? outletTerpilih;
  List salesList = [];
  TooltipBehavior? _tooltipBehavior;
  late List<DropdownMenuItem<String>> dropdownList_bulan;
  late List<DropdownMenuItem<String>> dropdownList_tahun;
  String? bulan_terpilih;
  String? tahun_terpilih;
  List data = [];
  bool loading = false;
  String total_average = "0";
  String total_target = "0";

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    dropdownList_bulan = [];
    dropdownList_tahun = [];
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "01", child: Text("Januari")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "02", child: Text("Februari")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "03", child: Text("Maret")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "04", child: Text("April")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "05", child: Text("Mei")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "06", child: Text("Juni")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "07", child: Text("Juli")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "08", child: Text("Agustus")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "09", child: Text("September")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "10", child: Text("Oktober")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "11", child: Text("November")));
    dropdownList_bulan
        .add(const DropdownMenuItem(value: "12", child: Text("Desember")));
    bulan_terpilih = DateFormat("MM").format(DateTime.now());
    int tahun_sekarang =
        int.tryParse(DateFormat("yyyy").format(DateTime.now())) ?? 2022;
    int tahun_max = tahun_sekarang + 4;
    int tahun_min = tahun_sekarang - 20;
    for (int i = tahun_min; i < tahun_max; i++) {
      dropdownList_tahun.add(DropdownMenuItem(value: "$i", child: Text("$i")));
    }
    tahun_terpilih = tahun_sekarang.toString();

    getTeam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Laporan Omset',
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
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Target",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: XAppColors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              iconEnabledColor: XAppColors.greenAccent,
                              value: bulan_terpilih,
                              items: dropdownList_bulan,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 15,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  bulan_terpilih = value.toString();
                                  setState(() {});
                                  getData();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Year",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: XAppColors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              iconEnabledColor: XAppColors.greenAccent,
                              value: tahun_terpilih,
                              items: dropdownList_tahun,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 15,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  tahun_terpilih = value.toString();
                                  setState(() {});
                                  getData();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select SPG",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (con) => PilihSpg(salesList))
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
                                      ? "Select SPG"
                                      : salesTerpilih!['name'].toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Outlet",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const PilihOutlet()))
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                outletTerpilih = value;
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
                                  (outletTerpilih == null)
                                      ? "Select Outlet"
                                      : outletTerpilih!['name'].toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            (loading == false)
                ? (data.isNotEmpty)
                    ? Expanded(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 16),
                                //   child: SfCartesianChart(
                                //       primaryXAxis: CategoryAxis(),
                                //       // Enable legend
                                //       legend: Legend(isVisible: false),
                                //       // Enable tooltip
                                //       tooltipBehavior: _tooltipBehavior,
                                //       series: <LineSeries<SalesData, String>>[
                                //         LineSeries<SalesData, String>(
                                //             dataSource: <SalesData>[
                                //               SalesData('Jan', 35),
                                //               SalesData('Feb', 28),
                                //               SalesData('Mar', 34),
                                //               SalesData('Apr', 32),
                                //               SalesData('May', 40),
                                //             ],
                                //             xValueMapper:
                                //                 (SalesData sales, _) =>
                                //                     sales.year,
                                //             yValueMapper:
                                //                 (SalesData sales, _) =>
                                //                     sales.sales)
                                //       ]),
                                // ),
                                const SizedBox(height: 24),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    "Data Outlet",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                for (int i = 0; i < data.length; i++)
                                  outletCard(i),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Average : ${config().format_rupiah(total_average)}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: XAppColors.grey,
                                        ),
                                      ),
                                      Text(
                                        "Total Target : ${config().format_rupiah(total_target)}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: XAppColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(height: 8),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 16),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         "(%) Target :  38%",
                                //         style: TextStyle(
                                //           fontSize: 10,
                                //           fontWeight: FontWeight.w400,
                                //           color: XAppColors.grey,
                                //         ),
                                //       ),
                                //       Text(
                                //         "(%) Growth to 2023 :  72%",
                                //         style: TextStyle(
                                //           fontSize: 10,
                                //           fontWeight: FontWeight.w400,
                                //           color: XAppColors.grey,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Kosong()
                : Expanded(child: LoadingForm(context, loading)),
          ],
        ),
      ),
    );
  }

  Widget outletCard(int index) {
    Map obj_data = data[index];
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: XCacheNetworkImage(
              imageUrl: obj_data['image'].toString(),
              size: const Size(42, 42),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Average : ${config().format_rupiah(obj_data['average'].toString())}",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.grey,
                ),
              ),
              Text(
                obj_data['name'].toString(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Target Month : ${config().format_rupiah(obj_data['target_bulanan'].toString())}",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: XAppColors.greenAccent,
                ),
              ),
            ],
          )),
          Text(
            "Month: ${getBulan(bulan_terpilih!)}",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: XAppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String getBulan(String no) {
    if (bulan_terpilih == "01") {
      return "Januari";
    } else if (bulan_terpilih == "02") {
      return "Februari";
    } else if (bulan_terpilih == "03") {
      return "Maret";
    } else if (bulan_terpilih == "04") {
      return "April";
    } else if (bulan_terpilih == "05") {
      return "Mei";
    } else if (bulan_terpilih == "06") {
      return "Juni";
    } else if (bulan_terpilih == "07") {
      return "Juli";
    } else if (bulan_terpilih == "08") {
      return "Agustus";
    } else if (bulan_terpilih == "09") {
      return "September";
    } else if (bulan_terpilih == "10") {
      return "Oktober";
    } else if (bulan_terpilih == "11") {
      return "November";
    } else if (bulan_terpilih == "12") {
      return "Desember";
    } else {
      return "-";
    }
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
                "assets/images/no_report.png",
                height: 182,
              ),
              const SizedBox(height: 42),
              Text(
                'Pilih Format Laporan Anda',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: XAppColors.primaryColors,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Silahkan untuk pilih format laporan anda mulai dari target dan outlet',
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
    showLoading(context, message: "Sedang Mengambil data...");
    Api().getUserByTL().then((value) {
      hideLoading();
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response.containsKey('data')) {
            List data = response['data'];
            for (int i = 0; i < data.length; i++) {
              if (data[i]['jabatan'].toString().toLowerCase() == "spg") {
                salesList.add(data[i]);
              }
            }
          }
        }
      }
      setState(() {});
    });
  }

  void getData() {
    if (outletTerpilih != null) {
      setState(() {
        loading = true;
      });
      Map<String, String> params = <String, String>{};
      if (salesTerpilih != null) {
        params['id_user'] = salesTerpilih!['id'].toString();
      } else {
        params['id_user'] = "";
      }
      params['id'] = outletTerpilih!['id'].toString();
      params['date'] = "$tahun_terpilih-$bulan_terpilih";
      Api().getLaporanOmset(params).then((value) {
        loading = false;
        if (value != null) {
          if (config.isJsonValid(value)) {
            var response = jsonDecode(value);
            total_average = response['total_average'].toString();
            total_target = response['total_target'].toString();
            if (response.containsKey('data')) {
              data = response['data'];
            }
          }
        }
        setState(() {});
      });
    }
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
