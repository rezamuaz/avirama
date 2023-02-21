import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OutletDashboardPICView extends StatefulWidget {
  Map data_outlet;

  OutletDashboardPICView(this.data_outlet, {super.key});

  @override
  State<OutletDashboardPICView> createState() => _OutletDashboardPICViewState();
}

class _OutletDashboardPICViewState extends State<OutletDashboardPICView> {
  bool loading = true;
  List kompetitorList = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PIC Outlet Principal and Competitor',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
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
              color: const Color(0xffF6F8FA),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Outlet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Anda pilih PIC untuk outlet',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: XAppColors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: XAppColors.green),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
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
                                  Text(
                                    '${widget.data_outlet['name']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${widget.data_outlet['address']}',
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
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Principal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Data PIC Principal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: XAppColors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (widget.data_outlet['principal'] != null)
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const XCacheNetworkImage(
                                imageUrl: "",
                                size: Size(42, 42),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          widget.data_outlet['principal']
                                                  ['name'] ??
                                              "",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          DateFormat.yMMMEd(
                                            "ID",
                                          )
                                              .format(DateTime.parse(widget
                                                      .data_outlet['principal']
                                                  ['created_at']))
                                              .toString(),
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: XAppColors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    widget.data_outlet['principal']
                                            ['no_tlpn'] ??
                                        "",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    widget.data_outlet['principal']['alamat'] ??
                                        "",
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
                      ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Kompetitor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Data Produk Kompetitor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: XAppColors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    for (int i = 0; i < kompetitorList.length; i++)
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: XCacheNetworkImage(
                                imageUrl: kompetitorList[i]['image'],
                                size: const Size(42, 42),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kompetitorList[i]['name'] ?? "",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    config().format_rupiah(
                                        kompetitorList[i]['price'].toString())!,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                DateFormat.yMMMEd(
                                  "ID",
                                )
                                    .format(DateTime.parse(
                                        widget.data_outlet['principal']
                                            ['updated_at']))
                                    .toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: XAppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )
          : LoadingForm(context, loading),
    );
  }

  void getData() {
    Map<String, String> params = <String, String>{};
    params['id_outlet'] = widget.data_outlet['id'].toString();
    Api().getProdukKompetitorAll(params).then((value) {
      loading = false;
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response.containsKey('data')) {
            kompetitorList = response['data'];
          }
        }
      }
      setState(() {});
    });
  }
}
