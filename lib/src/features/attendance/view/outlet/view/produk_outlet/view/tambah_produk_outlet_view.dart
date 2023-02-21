import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/tambah_produk_outlet_body.dart';
import 'package:absensi_app/src/network/model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TambahProdukOutletView extends StatefulWidget {
  final int idOutlet;
  final User user;

  const TambahProdukOutletView(this.idOutlet, this.user, {super.key});

  @override
  State<TambahProdukOutletView> createState() => _TambahProdukOutletViewState();
}

class _TambahProdukOutletViewState extends State<TambahProdukOutletView> {
  String searchquery = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductOutletBloc>(
        create: (context) => ProductOutletBloc(),
        child: TambahProdukOutletBody(widget.idOutlet, widget.user));
  }
}
