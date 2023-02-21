import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class SearchProdukOutlet extends StatefulWidget {
  const SearchProdukOutlet({super.key});

  @override
  State<SearchProdukOutlet> createState() => _SearchProdukOutletState();
}

class _SearchProdukOutletState extends State<SearchProdukOutlet> {
  TextEditingController searchController = TextEditingController();
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
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 10),
                child: Text(
                  'Cari Produk',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: (const EdgeInsets.symmetric(horizontal: 16)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Cari Produk",
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
                        Icons.search_outlined,
                        color: XAppColors.grey,
                        size: 18,
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 5, top: 5, right: 15),
                    ),
                    readOnly: false,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: XButton(
                  title: "Cari",
                  onPressed: () {
                    if (searchController.text.isEmpty) {
                      Navigator.pop(context, true);
                    } else {
                      setState(() {
                        loading = true;
                        getData();
                      });
                    }
                  },
                  width: MediaQuery.of(context).size.width,
                  enabled: !loading,
                  busy: loading,
                  backgroundColor: XAppColors.primaryColors,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void getData() {
    Navigator.pop(context, searchController.text);
  }
}
