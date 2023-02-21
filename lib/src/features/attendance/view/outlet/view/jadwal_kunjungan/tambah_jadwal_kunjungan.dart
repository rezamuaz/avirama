import 'dart:convert';
import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/form/pilih_outlet.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TambahJadwalKunjungan extends StatefulWidget {
  Map? data_edit;

  TambahJadwalKunjungan({super.key, this.data_edit});

  @override
  State<TambahJadwalKunjungan> createState() => _TambahJadwalKunjunganState();
}

class _TambahJadwalKunjunganState extends State<TambahJadwalKunjungan> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool valid_form = false;
  bool loading = false;
  Map? outlet;

  @override
  initState() {
    super.initState();
    if (widget.data_edit != null) {
      namaController.text = widget.data_edit!['outlet'] ?? "";
      tglController.text = widget.data_edit!['date'] ?? "";
      validasi_form();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          (widget.data_edit == null)
              ? 'Tambah Jadwal Kunjungan'
              : 'Edit Jadwal Kunjungan',
          style: const TextStyle(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding:
                    (const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: namaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Nama Outlet",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: XAppColors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: XAppColors.grey,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.discount,
                        color: XAppColors.grey,
                        size: 18,
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 5, top: 5, right: 15),
                    ),
                    readOnly: true,
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PilihOutlet()))
                          .then((value) {
                        if (value != null) {
                          outlet = value;
                          namaController.text = outlet!['name'] ?? "";
                          validasi_form();
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    (const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: tglController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Tanggal Kunjungan",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: XAppColors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: XAppColors.grey,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        color: XAppColors.grey,
                        size: 18,
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 5, top: 5, right: 15),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          initialDatePickerMode: DatePickerMode.day,
                          firstDate: DateTime(2015),
                          lastDate: DateTime(2101));
                      if (picked != null) selectedDate = picked;
                      tglController.text = DateFormat.yMMMEd(
                        "ID",
                      ).format(selectedDate);
                      validasi_form();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            XButton(
              width: MediaQuery.of(context).size.width,
              backgroundColor:
                  (valid_form) ? XAppColors.green : Colors.grey[500],
              onPressed: () async {
                if (widget.data_edit != null) {
                  EditData();
                } else {
                  SimpanData();
                }
              },
              busy: loading,
              enabled: valid_form && loading == false,
              title: "Simpan Jadwal",
            ),
          ],
        ),
      ),
    );
  }

  void validasi_form() {
    if (namaController.text.isNotEmpty) {
      if (tglController.text.isNotEmpty) {
        valid_form = true;
      } else {
        valid_form = false;
      }
    } else {
      valid_form = false;
    }
    setState(() {});
  }

  void SimpanData() {
    setState(() {
      loading = true;
    });
    Map params = new Map();
    params['store_id'] = outlet!['id'].toString();
    params['date'] = DateFormat("yyyy-MM-dd").format(selectedDate);
    Api().addJadwalKunjungan(params).then((value) {
      setState(() {
        loading = false;
      });
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response['status'] == true) {
            XToast.show("Berhasil menambah jadwal kunjungan");
            Navigator.pop(context, true);
          } else {
            FlashMessage.error(
                context: context,
                title: "Gagal menambah jadwal kunjungan",
                message: response['message'].toString());
          }
        } else {
          FlashMessage.error(
              context: context,
              title: "Gagal menambah jadwal kunjungan",
              message: "Silahkan cek koneksi internet Anda !");
        }
      } else {
        FlashMessage.error(
            context: context,
            title: "Gagal menambah jadwal kunjungan",
            message: "Silahkan cek koneksi internet Anda !");
      }
    });
  }

  void EditData() {
    setState(() {
      loading = true;
    });
    Map params = {};
    if (outlet != null) {
      params['store_id'] = outlet!['id'].toString();
    } else {
      params['store_id'] = widget.data_edit!['store_id'];
    }
    if (selectedDate != null) {
      params['date'] = DateFormat("yyyy-MM-dd").format(selectedDate);
    } else {
      params['date'] = tglController.text;
    }
    Api().editJadwalKunjungan(params, widget.data_edit!['id']).then((value) {
      setState(() {
        loading = false;
      });
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response['status'] == true) {
            XToast.show("Berhasil memperbarui jadwal kunjungan");
            Navigator.pop(context, true);
          } else {
            FlashMessage.error(
                context: context,
                title: "Gagal edit jadwal kunjungan",
                message: response['message'].toString());
          }
        } else {
          FlashMessage.error(
              context: context,
              title: "Gagal edit jadwal kunjungan",
              message: "Silahkan cek koneksi internet Anda !");
        }
      } else {
        FlashMessage.error(
            context: context,
            title: "Gagal edit jadwal kunjungan",
            message: "Silahkan cek koneksi internet Anda !");
      }
    });
  }
}
