import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/features/pic/outlet_dashboard_pic.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:flutter/material.dart';

class DaftarOutletPIC extends StatefulWidget {
  const DaftarOutletPIC({Key? key}) : super(key: key);

  @override
  State<DaftarOutletPIC> createState() => _DaftarOutletPICState();
}

class _DaftarOutletPICState extends State<DaftarOutletPIC> {
  bool loading = true;
  List dataList = [];

  @override
  initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PIC Outlet Principal',
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
              child: (dataList.isNotEmpty)
                  ? ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return outletCard(index);
                      })
                  : Kosong(),
            )
          : LoadingForm(context, loading),
    );
  }

  Widget outletCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OutletDashboardPICView(dataList[index])));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${dataList[index]['name'] ?? "-"}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                          ),
                        ),
                        const Text(
                          'Buka 09:00 - 21:00',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: XAppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 14),
                      ],
                    ),
                    Text(
                      '${dataList[index]['address'] ?? "-"}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                'Silahkan hubungi admin untuk menambahkan outlet',
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

  void getData() {
    Api().getOutlet().then((value) {
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
