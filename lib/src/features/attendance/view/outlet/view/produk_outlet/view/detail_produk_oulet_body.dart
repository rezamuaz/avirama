import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/edit_produk_outlet_view.dart';
import 'package:absensi_app/src/network/model/user/user.dart';
import 'package:absensi_app/src/services/auth_service.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class DetailProdukOutletBody extends StatefulWidget {
  const DetailProdukOutletBody(
      {this.outletId, this.assignProductId, super.key});
  final int? outletId;
  final String? assignProductId;

  @override
  State<DetailProdukOutletBody> createState() => _DetailProdukOutletBodyState();
}

class _DetailProdukOutletBodyState extends State<DetailProdukOutletBody> {
  late ValueNotifier<User?> user;
  TextEditingController searchController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    user = ValueNotifier<User?>(Auth.instance.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductOutletBloc, ProductOutletState>(
      listener: (context, state) {
        state.whenOrNull(
          productDeleted: (data) {
            setState(() {
              loading = true;
            });
            XToast.show("Produk berhasil dihapus");
            Navigator.pop(context, true);
          },
          isError: (networkExceptions) {
            networkExceptions.whenOrNull(
                notFound: (reason) => XToast.show("$reason"));
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          productDetailed: (data) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 24, bottom: 10),
                          child: Text(
                            'Data Produk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: XCacheNetworkImage(
                                imageUrl: data.foto ?? "",
                                size: const Size(62, 62),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    data.codeProduct ?? "",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    config().format_rupiah(data.price == null
                                        ? "0"
                                        : data.price.toString())!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: XAppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  user.value!.jabatan == 'MD'
                                      ? Text(
                                          "Omset : ${config().format_rupiah("0")}",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: XAppColors.greenAccent,
                                          ),
                                        )
                                      : Text(
                                          "Omset : ${config().format_rupiah(data.omset == null ? "0" : data.omset.toString())}",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: XAppColors.greenAccent,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            Text(
                              data.createdAt == null
                                  ? ""
                                  : DateFormat.yMMMEd(
                                      "ID",
                                    )
                                      .format(DateTime.parse(data.createdAt!))
                                      .toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: XAppColors.grey,
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Awal",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${data.initialStock ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Akhir",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.finalStock ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Sales",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${data.soldStock ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Pajang Awal",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.displayStockAwal ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Pajang Akhir",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.displayStockAkhir ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Gudang Awal",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.wherehouseStockAwal ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Gudang Akhir",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.wherehouseStockAkhir ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Stok Datang Barang",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.comeGood ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Retur",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.returnGood ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Facing",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.facing ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tir",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "${data.tir ?? "0"}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Catatan:",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                data.description ?? "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: XButton(
                            title: "Edit",
                            onPressed: () {
                              Logger().v(data.description);
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProdukOutletView(data,
                                                  widget.assignProductId)))
                                  .then((value) {
                                if (value != null && value == true) {
                                  Navigator.pop(context, true);
                                }
                              });
                            },
                            width: MediaQuery.of(context).size.width,
                            enabled: !loading,
                            busy: false,
                            backgroundColor: XAppColors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: XButton(
                            title: "Hapus dari Checklist",
                            onPressed: () {
                              setState(() {
                                loading = true;
                                context.read<ProductOutletBloc>().add(
                                    ProductOutletEvent.deleteProduct(
                                        outletId: data.outletId!,
                                        productId: data.productId.toString()));
                              });
                            },
                            width: MediaQuery.of(context).size.width,
                            enabled: !loading,
                            busy: loading,
                            backgroundColor: XAppColors.danger,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
