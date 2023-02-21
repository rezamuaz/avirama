import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/widget/barang_kosong.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

class PilihProdukOutlet extends StatefulWidget {
  const PilihProdukOutlet(
      {this.product, this.loading = true, this.kosong = true, Key? key})
      : super(key: key);
  final ProductOutletPaging? product;
  final bool loading;
  final bool kosong;
  @override
  State<PilihProdukOutlet> createState() => _PilihProdukOutletState();
}

class _PilihProdukOutletState extends State<PilihProdukOutlet> {
  List dataList = [];

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
          'Pilih Produk',
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
              child: SingleChildScrollView(
                child: Column(
                  children: widget.kosong
                      ? [barangKosong(context)]
                      : List.generate(widget.product!.data!.length,
                          (index) => produkCard(widget.product!.data![index])),
                ),
              ),
            )
          : LoadingForm(context, widget.loading),
    );
  }

  Widget produkCard(ProductOutlet item) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, item);
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
                    imageUrl: item.product!.image ?? "",
                    size: const Size(42, 43),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.product!.name ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.product!.name ?? "-",
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
            const Divider(
              height: 0.5,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  // void getData() {
  //   Api().getProdukOutlet(0).then((value) {
  //     loading = false;
  //     if (value != null) {
  //       if (config.isJsonValid(value)) {
  //         var response = jsonDecode(value);
  //         if (response.containsKey('data')) {
  //           dataList = response['data'];
  //           setState(() {});
  //         } else {
  //           FlashMessage.error(
  //               context: context,
  //               title: "Gagal mengambil data",
  //               message: response['message'].toString());
  //         }
  //       } else {
  //         FlashMessage.error(
  //             context: context,
  //             title: "Gagal mengambil data",
  //             message: "Silahkan cek koneksi internet Anda !");
  //       }
  //     } else {
  //       FlashMessage.error(
  //           context: context,
  //           title: "Gagal mengambil data",
  //           message: "Silahkan cek koneksi internet Anda !");
  //     }
  //   });
  // }
}
