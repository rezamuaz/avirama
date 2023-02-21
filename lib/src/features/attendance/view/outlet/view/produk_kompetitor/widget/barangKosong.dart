import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';

Widget barangKosong(BuildContext context) {
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/produk_kosong.png",
              height: 85,
            ),
            const SizedBox(height: 42),
            Text(
              'Produk Kosong',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: XAppColors.primaryColors,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Silahkan untuk ceklist produk terlebih dahulu',
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
