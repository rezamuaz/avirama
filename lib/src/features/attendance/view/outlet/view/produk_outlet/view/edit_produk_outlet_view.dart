import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/edit_produk_outlet_body.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet_detail.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProdukOutletView extends StatefulWidget {
  final ProductOutletDetail produk;
  final String? assignProductId;
  const EditProdukOutletView(this.produk, this.assignProductId, {super.key});

  @override
  State<EditProdukOutletView> createState() => _EditProdukOutletViewState();
}

class _EditProdukOutletViewState extends State<EditProdukOutletView> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductOutletBloc>(
      create: (context) => ProductOutletBloc(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Edit Produk',
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
          body: EditProdukOutletBody(widget.produk, widget.assignProductId!)),
    );
  }
}
