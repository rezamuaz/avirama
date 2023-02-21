import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePicker extends StatefulWidget {
  String? tanggal_awal;
  String? tanggal_akhir;
  String? range;

  DateRangePicker(
      {super.key, this.tanggal_awal, this.tanggal_akhir, this.range});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateRangePickerController tanggalController = DateRangePickerController();
  String tanggal_awal = "";
  String tanggal_akhir = "";
  String range = "";
  late DateTime start;
  late DateTime end;

  @override
  void initState() {
    tanggal_awal = widget.tanggal_awal!;
    tanggal_akhir = widget.tanggal_akhir!;
    range = widget.range!;
    start = DateFormat("yyyy-MM-dd").parse(tanggal_awal);
    end = DateFormat("yyyy-MM-dd").parse(tanggal_akhir);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Icon(Icons.clear, size: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Pilih Tanggal",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SfDateRangePicker(
                controller: tanggalController,
                onSelectionChanged: onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                selectionColor: XAppColors.green,
                endRangeSelectionColor: XAppColors.green,
                backgroundColor: Colors.white,
                rangeSelectionColor: XAppColors.greenMuda,
                startRangeSelectionColor: XAppColors.green,
                todayHighlightColor: XAppColors.green,
                initialSelectedRange: PickerDateRange(start, end),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    widget.tanggal_awal = tanggal_awal;
                    widget.tanggal_akhir = tanggal_akhir;
                    widget.range = range;
                    Map data = {};
                    data['tanggal_awal'] = tanggal_awal;
                    data['tanggal_akhir'] = tanggal_akhir;
                    data['range'] = range;
                    Navigator.pop(context, data);
                  },
                  child: Container(
                    height: 40,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: XAppColors.green,
                    ),
                    child: Center(
                      child: Text(
                        "Terapkan",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value != null) {
      String startDate = "";
      String endDate = "";
      String modeFilter = "";
      DateTime now = DateTime.now();
      if (args.value.startDate != null) {
        startDate =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString();
      }
      if (args.value.endDate != null) {
        endDate =
            DateFormat('dd/MM/yyyy').format(args.value.endDate).toString();
      }
      if (startDate ==
              DateFormat('dd/MM/yyyy').format(DateTime.now()).toString() &&
          endDate ==
              DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()) {
        modeFilter = "Hari ini";
      } else if (startDate ==
              DateFormat('dd/MM/yyyy')
                  .format(DateTime(now.year, now.month, 1))
                  .toString() &&
          endDate ==
              DateFormat('dd/MM/yyyy')
                  .format(DateTime(now.year, now.month + 1, 0))
                  .toString()) {
        modeFilter = "Bulan ini";
      }
      if (args.value is PickerDateRange) {
        if (args.value.startDate != null) {
          range =
              '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} - ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
          tanggal_awal =
              DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
        }
        if (args.value.endDate != null) {
          tanggal_akhir =
              DateFormat('yyyy-MM-dd').format(args.value.endDate).toString();
        } else {
          tanggal_akhir =
              DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
        }
      } else {
        tanggal_awal =
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
        tanggal_akhir =
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      }
    }
    setState(() {});
  }
}
