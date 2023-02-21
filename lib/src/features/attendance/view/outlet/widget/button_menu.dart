import 'package:flutter/material.dart';

Widget butonMenu(
    String judul, String keterangan, String icon, Color warna, var onKlik) {
  return GestureDetector(
    onTap: onKlik,
    child: Container(
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          Image.asset(icon, height: 32),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                keterangan,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          )),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
