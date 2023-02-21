import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/daftar_product_outlet_child.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/daftar_product_outlet_empty.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaftarProdukOutletBody extends StatefulWidget {
  final int id_outlet;

  const DaftarProdukOutletBody(this.id_outlet, {super.key});

  @override
  State<DaftarProdukOutletBody> createState() => DaftarProdukOutletBodyState();
}

class DaftarProdukOutletBodyState extends State<DaftarProdukOutletBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductOutletBloc, ProductOutletState>(
        builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: state.whenOrNull(
          isLoading: () => LoadingForm(context, true),
          productById: (data) => DaftarProductOutletChild(widget.id_outlet,
              dataOrigin: data, emptyData: false),
          isError: (error) => error.whenOrNull(
            notFound: (reason) {
              return const DaftarProductOutletEmpty();
            },
          ),
        ),
      );
    });
  }
}
