import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/network/model/report/outlet_report.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

class PilihOutlet extends StatefulWidget {
  const PilihOutlet({this.outletList, Key? key}) : super(key: key);
  final List<OutletReport>? outletList;
  @override
  State<PilihOutlet> createState() => _PilihOutletState();
}

class _PilihOutletState extends State<PilihOutlet> {
  TextEditingController cariController = TextEditingController();
  bool loading = true;
  List dataOutletList = [];
  List dataOriList = [];

  @override
  void initState() {
    super.initState();
    getData();
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
      body: (loading == false)
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: widget.outletList!.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return OutletCard(index);
                  }))
          : LoadingForm(context, loading),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: cariController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Cari Outlet",
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: XAppColors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: XAppColors.grey,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: XAppColors.grey,
                size: 18,
              ),
              contentPadding:
                  const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 15),
            ),
            onChanged: (value) {
              onSearch();
            },
          ),
        ),
      ),
    );
  }

  Widget OutletCard(int index) {
    Map outlet = dataOutletList[index];
    return InkWell(
      onTap: () {
        Navigator.pop(context, outlet);
      },
      child: Container(
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
                    imageUrl: "${Api.Url_image}${outlet['image'] ?? ""}",
                    size: const Size(42, 43),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        outlet['name'] ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        outlet['address'] ?? "-",
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

  void getData() {
    Api().getOutlet().then((value) {
      loading = false;
      if (value != null) {
        if (config.isJsonValid(value)) {
          var response = jsonDecode(value);
          if (response.containsKey('data')) {
            dataOriList = response['data'];
            onSearch();
          } else {
            FlashMessage.error(
                context: context,
                title: "Gagal mengambil data",
                message: response['message'].toString());
          }
        } else {
          FlashMessage.error(
              context: context,
              title: "Gagal mengambil data",
              message: "Silahkan cek koneksi internet Anda !");
        }
      } else {
        FlashMessage.error(
            context: context,
            title: "Gagal mengambil data",
            message: "Silahkan cek koneksi internet Anda !");
      }
    });
  }

  void onSearch() {
    dataOutletList.clear();
    if (cariController.text.isNotEmpty) {
      for (int i = 0; i < dataOriList.length; i++) {
        if (dataOriList[i]['name']
            .toString()
            .toLowerCase()
            .contains(cariController.text.toLowerCase())) {
          dataOutletList.add(dataOriList[i]);
        }
      }
    } else {
      dataOutletList.addAll(dataOriList);
    }
    setState(() {});
  }
}
