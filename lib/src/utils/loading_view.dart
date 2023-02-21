import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget LoadingForm(BuildContext context, bool isLoading) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    child: SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 15,
                width: width / 2,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 15,
                width: width,
                color: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 15,
                width: width / 2,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 15,
                width: width,
                color: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 15,
                width: width / 2,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 15,
                width: width,
                color: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
