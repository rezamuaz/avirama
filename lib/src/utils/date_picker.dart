import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  String? tanggal_awal;

  DatePicker({super.key, this.tanggal_awal});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateRangePickerController tanggalController = DateRangePickerController();
  String tanggal_awal = "";
  late DateTime start;

  @override
  void initState() {
    tanggal_awal = widget.tanggal_awal!;
    start = DateFormat("yyyy-MM-dd").parse(tanggal_awal);
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
                selectionMode: DateRangePickerSelectionMode.single,
                selectionColor: XAppColors.green,
                endRangeSelectionColor: XAppColors.green,
                backgroundColor: Colors.white,
                rangeSelectionColor: XAppColors.greenMuda,
                startRangeSelectionColor: XAppColors.green,
                todayHighlightColor: XAppColors.green,
                initialSelectedRange: PickerDateRange(start, start),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    widget.tanggal_awal = tanggal_awal;
                    Navigator.pop(context, tanggal_awal);
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
      DateTime now = DateTime.now();
      tanggal_awal = DateFormat('yyyy-MM-dd').format(args.value).toString();
    }
    setState(() {});
  }
}
