import 'package:absensi_app/src/network/model/report/outlet_report.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

class SelectOutletReport extends StatefulWidget {
  const SelectOutletReport({this.outletList, this.loading = true, Key? key})
      : super(key: key);
  final List<OutletReport>? outletList;
  final bool loading;
  @override
  State<SelectOutletReport> createState() => _SelectOutletReportState();
}

class _SelectOutletReportState extends State<SelectOutletReport> {
  TextEditingController cariController = TextEditingController();
  // bool loading = true;
  List dataOutletList = [];
  List dataOriList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pilih Outlet',
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
      body: (widget.loading == false)
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: widget.outletList!.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return outletCard(widget.outletList![index]);
                  }))
          : LoadingForm(context, widget.loading),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //       left: 16,
      //       right: 16,
      //       top: 16,
      //       bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: TextFormField(
      //       controller: cariController,
      //       keyboardType: TextInputType.text,
      //       decoration: InputDecoration(
      //         hintText: "Cari Outlet",
      //         hintStyle: const TextStyle(
      //           fontSize: 12,
      //           fontWeight: FontWeight.w400,
      //           color: XAppColors.grey,
      //         ),
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(20.0),
      //           borderSide: const BorderSide(
      //             color: XAppColors.grey,
      //           ),
      //         ),
      //         prefixIcon: const Icon(
      //           Icons.search_outlined,
      //           color: XAppColors.grey,
      //           size: 18,
      //         ),
      //         contentPadding:
      //             const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 15),
      //       ),
      //       onChanged: (value) {
      //         onSearch();
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  Widget outletCard(OutletReport outlet) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, outlet);
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: XCacheNetworkImage(
                    imageUrl: outlet.image!,
                    size: const Size(42, 43),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        outlet.name ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        outlet.address ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 0.5,
                thickness: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
