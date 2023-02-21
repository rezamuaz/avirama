import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/jadwal_kunjungan/tambah_jadwal_kunjungan.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class DetailJadwalKunjungan extends StatefulWidget {
  final Map jadwal;

  const DetailJadwalKunjungan(this.jadwal, {super.key});

  @override
  State<DetailJadwalKunjungan> createState() => _DetailJadwalKunjunganState();
}

class _DetailJadwalKunjunganState extends State<DetailJadwalKunjungan> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 10),
                child: Center(
                  child: Text(
                    'Data Kunjungan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                      Expanded(
                          child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.jadwal['outlet'] ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: XAppColors.grey,
                                          ),
                                        ),
                                        Text(
                                          widget.jadwal['date'] ?? "",
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
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nama Outlet",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      widget.jadwal['outlet'] ?? "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tanggal Kunjungan",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      widget.jadwal['date'] ?? "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: XButton(
                  title: "Edit",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TambahJadwalKunjungan(
                                data_edit: widget.jadwal))).then((value) {
                      if (value != null && value == true) {
                        Navigator.pop(context, true);
                      }
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  enabled: !loading,
                  busy: false,
                  backgroundColor: XAppColors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: XButton(
                  title: "Hapus",
                  onPressed: () {
                    setState(() {
                      loading = true;
                      deleteData();
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  enabled: !loading,
                  busy: loading,
                  backgroundColor: XAppColors.danger,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  void deleteData() {
    Api().deleteJadwalKunjungan(widget.jadwal['id']).then((value) {
      setState(() {
        loading = false;
      });
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response['status'] == true) {
            XToast.show("Berhasil menghapus data");
            Navigator.pop(context, true);
          } else {
            FlashMessage.error(
                context: context,
                title: "Data gagal di hapus",
                message: response['message'].toString());
          }
        } else {
          FlashMessage.error(context: context, title: "Data gagal di hapus");
        }
      } else {
        FlashMessage.error(context: context, title: "Data gagal di hapus");
      }
    });
  }
}
