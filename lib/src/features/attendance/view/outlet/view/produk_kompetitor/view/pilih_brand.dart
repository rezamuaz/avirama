import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_brand.dart';
import 'package:absensi_app/src/network/model/report/user_report.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

class PilihBrand extends StatefulWidget {
  final List<KompetitorBrand>? data;
  final bool loading;

  const PilihBrand({this.data, this.loading = true, super.key});

  @override
  State<PilihBrand> createState() => _PilihBrandState();
}

class _PilihBrandState extends State<PilihBrand> {
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
          'Pilih Brand',
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
                    children: List.generate(widget.data!.length,
                        (index) => produkCard(widget.data![index]))),
              ),
            )
          : LoadingForm(context, widget.loading),
    );
  }

  Widget produkCard(KompetitorBrand item) {
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
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(4),
                //   child: XCacheNetworkImage(
                //     imageUrl: item.profilePhotoPath ?? "",
                //     size: const Size(42, 43),
                //   ),
                // ),
                // const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.name ?? "-",
                    style: const TextStyle(
                      fontSize: Constants.kFontSizeL,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
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
}
