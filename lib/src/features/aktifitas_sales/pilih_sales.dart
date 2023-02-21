import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

class PilihSales extends StatefulWidget {
  List dataList;

  PilihSales(this.dataList, {super.key});

  @override
  State<PilihSales> createState() => _PilihSalesState();
}

class _PilihSalesState extends State<PilihSales> {
  List dataFix = [];
  TextEditingController cariController = TextEditingController();

  @override
  void initState() {
    onSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 50,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 16),
                child: Text(
                  "Select Team",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < dataFix.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context, dataFix[i]);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 16),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: XCacheNetworkImage(
                                      imageUrl: dataFix[i]
                                              ['profile_photo_path'] ??
                                          "",
                                      size: const Size(45, 45),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataFix[i]['name'] ?? "-",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          dataFix[i]['email'] ?? "-",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: XAppColors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          dataFix[i]['jabatan'] ?? "-",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: XAppColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    dataFix[i]['principal'] ?? "-",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: cariController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Cari Team",
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
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 5, top: 5, right: 15),
                    ),
                    onChanged: (value) {
                      onSearch();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  void onSearch() {
    dataFix.clear();
    if (cariController.text.isNotEmpty) {
      for (int i = 0; i < widget.dataList.length; i++) {
        if (widget.dataList[i]['name']
            .toString()
            .toLowerCase()
            .contains(cariController.text.toLowerCase())) {
          dataFix.add(widget.dataList[i]);
        }
      }
    } else {
      dataFix.addAll(widget.dataList);
    }
    setState(() {});
  }
}
