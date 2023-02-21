import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/daftar_produk_outlet._body.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/tambah_produk_outlet_view.dart';
import 'package:absensi_app/src/network/model/user/user.dart';
import 'package:absensi_app/src/services/auth_service.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaftarProdukOutletView extends StatefulWidget {
  final int id_outlet;

  const DaftarProdukOutletView(this.id_outlet, {super.key});

  @override
  State<DaftarProdukOutletView> createState() => _DaftarProdukOutletViewState();
}

class _DaftarProdukOutletViewState extends State<DaftarProdukOutletView> {
  late ValueNotifier<User?> user;
  User? usercopy;
  void callback() {}

  @override
  initState() {
    super.initState();
    user = ValueNotifier<User?>(Auth.instance.user);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductOutletBloc>(
      create: (context) => ProductOutletBloc()
        ..add(ProductOutletEvent.getProduct(outletId: widget.id_outlet)),
      child: Scaffold(
          floatingActionButton: ValueListenableBuilder<User?>(
            valueListenable: user,
            builder: (BuildContext context, User? usercopy, Widget? child) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TambahProdukOutletView(
                              widget.id_outlet, usercopy!))).then((value) {
                    if (value == true) {
                      BlocProvider.of<ProductOutletBloc>(context).add(
                          ProductOutletEvent.getProduct(
                              outletId: widget.id_outlet));
                    }
                  });
                },
                backgroundColor: XAppColors.green,
                child: const Icon(Icons.add),
              );
            },
          ),
          body: DaftarProdukOutletBody(
            widget.id_outlet,
          )),
    );
  }
}
