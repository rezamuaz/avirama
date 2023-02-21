import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailAktifitas extends StatefulWidget {
  String? tgl;
  Map? dataUser;
  List? absensiList;
  List? kunjunganList;
  List? produk_outletList;
  DetailAktifitas(
      {super.key,
      this.tgl,
      this.dataUser,
      this.absensiList,
      this.kunjunganList,
      this.produk_outletList});

  @override
  State<DetailAktifitas> createState() => _DetailAktifitasState();
}

class _DetailAktifitasState extends State<DetailAktifitas> {
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
                padding: EdgeInsets.only(top: 24, bottom: 8),
                child: Text(
                  "Detail Aktifitas",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  widget.tgl!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: XAppColors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < widget.absensiList!.length; i++)
                          absenCard(i),
                        for (int i = 0; i < widget.kunjunganList!.length; i++)
                          kunjunganCard(i),
                        for (int i = 0;
                            i < widget.produk_outletList!.length;
                            i++)
                          produkCard(i),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: Center(
                      child: Text(
                        "Tutup",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.red[400],
                        ),
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

  Widget absenCard(int index) {
    Map obj_absen = widget.absensiList![index];
    String outlet = "-";
    String address = "-";
    if (obj_absen['store'] != null) {
      outlet = obj_absen['store']['name'] ?? "-";
      address = obj_absen['store']['address'] ?? "-";
    }
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 180,
              width: 5,
              decoration: const BoxDecoration(
                  color: XAppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xffFDE5D4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/ic_alarm.png",
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
                                        widget.dataUser!['name'] ?? "-",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: XAppColors.grey,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      DateFormat.Hm(
                                        "ID",
                                      )
                                          .format(DateTime.parse(
                                              obj_absen['created_at']))
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: XAppColors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                  ],
                                ),
                                Text(
                                  'Lakukan Absensi di Outlet $outlet',
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
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: XCacheNetworkImage(
                            imageUrl:
                                "${Api.Url_image}${obj_absen['photo_int'] ?? "-"}",
                            size: const Size(73, 73),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              outlet,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              address,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: XAppColors.grey,
                              ),
                            ),
                            const Text.rich(TextSpan(
                                text: "Buka ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: XAppColors.greenAccent,
                                ),
                                children: [
                                  TextSpan(
                                    text: "09:00 - 21:00",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                ]))
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Koordinat Absen",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${obj_absen['lang_int']}, ${obj_absen['long_int']}",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: XAppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 14),
                      ],
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

  Widget kunjunganCard(int index) {
    Map objKunjungan = widget.kunjunganList![index];
    String outlet = "-";
    String address = "-";
    if (objKunjungan['store'] != null) {
      outlet = objKunjungan['store']['name'] ?? "-";
      address = objKunjungan['store']['address'] ?? "-";
    }
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 5,
              decoration: const BoxDecoration(
                  color: XAppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffD4FDD8),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/ic_calender.png",
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
                                      widget.dataUser!['name'] ?? "-",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: XAppColors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    DateFormat.Hm(
                                      "ID",
                                    )
                                        .format(DateTime.parse(
                                            objKunjungan['created_at']))
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                ],
                              ),
                              const Text(
                                'Tambah Jadwal Pertemuan',
                                style: TextStyle(
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
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          outlet,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        objKunjungan['date'] ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: XAppColors.grey,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: XAppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget produkCard(int index) {
    Map obj_produk = widget.produk_outletList![index];
    String img = "";
    String produk = "";
    if (obj_produk['product'] != null) {
      img = obj_produk['product']['image'] ?? "-";
      produk = obj_produk['product']['name'] ?? "-";
    }
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 108,
              width: 5,
              decoration: const BoxDecoration(
                  color: XAppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffD4E2FD),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/ic_add.png",
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
                                      widget.dataUser!['name'] ?? "-",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: XAppColors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    DateFormat.Hm(
                                      "ID",
                                    )
                                        .format(DateTime.parse(
                                            obj_produk['created_at']))
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                ],
                              ),
                              const Text(
                                'Tambah Data Produk Baru',
                                style: TextStyle(
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
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: XCacheNetworkImage(
                          imageUrl: Api.Url_image + img,
                          size: const Size(42, 42),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            config()
                                .format_rupiah(obj_produk['harga'].toString())!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.grey,
                            ),
                          ),
                          Text(
                            produk,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Omset : ${config().format_rupiah(obj_produk['omset'].toString())!}",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: XAppColors.greenAccent,
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
