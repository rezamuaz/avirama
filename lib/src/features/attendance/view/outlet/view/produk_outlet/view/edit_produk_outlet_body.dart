import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet_detail.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProdukOutletBody extends StatefulWidget {
  const EditProdukOutletBody(this.produk, this.assignProductId, {super.key});

  final String assignProductId;
  final ProductOutletDetail produk;

  @override
  State<EditProdukOutletBody> createState() => _EditProdukOutletBodyState();
}

class _EditProdukOutletBodyState extends State<EditProdukOutletBody> {
  TextEditingController comeGoodController = TextEditingController();
  TextEditingController facingController = TextEditingController();
  bool isLoading = false;
  TextEditingController noteController = TextEditingController();
  TextEditingController omsetController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController returController = TextEditingController();
  TextEditingController stokAkhirController = TextEditingController();
  TextEditingController stokAwalController = TextEditingController();
  TextEditingController stokGudangAkhirController = TextEditingController();
  TextEditingController stokGudangAwalController = TextEditingController();
  TextEditingController stokPajangAkhirController = TextEditingController();
  TextEditingController stokPajangAwalController = TextEditingController();
  TextEditingController tirController = TextEditingController();

  @override
  initState() {
    super.initState();
    comeGoodController.text = widget.produk.comeGood.toString();
    stokAkhirController.text = widget.produk.finalStock.toString();
    stokAwalController.text = widget.produk.initialStock.toString();
    stokPajangAwalController.text = widget.produk.displayStockAwal.toString();
    stokPajangAkhirController.text = widget.produk.displayStockAkhir.toString();
    stokGudangAwalController.text =
        widget.produk.wherehouseStockAwal.toString();
    stokGudangAkhirController.text =
        widget.produk.wherehouseStockAkhir.toString();
    priceController.text = widget.produk.price.toString();
    returController.text = widget.produk.returnGood.toString();
    omsetController.text = widget.produk.omset.toString();
    facingController.text = widget.produk.facing.toString();
    tirController.text = widget.produk.tir.toString();
    noteController.text = widget.produk.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductOutletBloc, ProductOutletState>(
      listener: (context, state) {
        state.whenOrNull(productUpdated: () {
          setState(() {
            isLoading = false;
          });
          XToast.show("Berhasil menyimpan data produk");
          Navigator.pop(context, true);
        }, isError: ((networkExceptions) {
          XToast.show("Gagal menyimpan data produk");
          Navigator.pop(context, false);
        }));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    //ANCHOR - Form Stok Awal
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Awal",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              enabled: false,
                              controller: stokAwalController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    //ANCHOR - Form Stok Akhir
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Akhir",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              enabled: false,
                              controller: stokAkhirController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    //ANCHOR - Form Stok Pajang
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Pajang Awal",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                stokPajangAwalController.clear();
                              },
                              controller: stokPajangAwalController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    //ANCHOR - Form Stok Pajang
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Pajang Akhir",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                stokPajangAkhirController.clear();
                              },
                              controller: stokPajangAkhirController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                // hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    //ANCHOR - Form Stok Gudang
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Gudang Awal",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                stokGudangAwalController.clear();
                              },
                              controller: stokGudangAwalController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    //ANCHOR - Form Stok Gudang
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Gudang Akhir",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                stokGudangAkhirController.clear();
                              },
                              controller: stokGudangAkhirController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    //ANCHOR - Form Stok Datang Barang
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stok Datang Barang",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                comeGoodController.clear();
                              },
                              controller: comeGoodController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Retur",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                returController.clear();
                              },
                              controller: returController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Facing",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                facingController.clear();
                              },
                              controller: facingController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tir",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                tirController.clear();
                              },
                              controller: tirController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onTap: () {
                                priceController.clear();
                              },
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "0",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 5, top: 5, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: (const EdgeInsets.symmetric(horizontal: 24)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Catatan",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              onTap: () {
                                noteController.clear();
                              },
                              controller: noteController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Ketik disini",
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
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 10, top: 10, right: 15),
                              ),
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 42),
                  ],
                ),
              ),
            ),
            Material(
              elevation: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  child: XButton(
                    title: "Simpan Produk",
                    backgroundColor: XAppColors.green,
                    enabled: !isLoading,
                    busy: isLoading,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      Map<String, String> params = <String, String>{};
                      params['product_id'] = widget.produk.productId.toString();
                      params['outlet_id'] = widget.produk.outletId.toString();
                      params['user_id'] = widget.produk.userId.toString();
                      params['product_assign_outlet_id'] =
                          widget.assignProductId.toString();
                      params['initial_stock'] =
                          widget.produk.initialStock.toString();
                      params['come_good'] = comeGoodController.text;
                      params['sold_stock'] = widget.produk.soldStock.toString();
                      params['display_stock'] = stokPajangAwalController.text;
                      params['wherehouse_stock'] =
                          stokGudangAwalController.text;
                      params['display_sak'] = stokPajangAkhirController.text;
                      params['warehouse_sak'] = stokGudangAkhirController.text;
                      params['final_stock'] =
                          widget.produk.finalStock.toString();
                      params['facing'] = facingController.text;
                      params['tir'] = tirController.text;
                      params['price'] = priceController.text;
                      params['return'] = returController.text;
                      params['description'] = noteController.text;
                      context.read<ProductOutletBloc>().add(
                          ProductOutletEvent.updateProduct(params: params));
                    },
                    showLoadingWidget: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
