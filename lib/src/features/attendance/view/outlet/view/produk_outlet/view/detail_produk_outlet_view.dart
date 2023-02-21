import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/bloc/product_outlet_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/detail_produk_oulet_body.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailProdukOutletView extends StatefulWidget {
  final int idOutlet;
  final ProductOutlet produkOulet;
  final String? assignProductId;

  const DetailProdukOutletView(this.idOutlet, this.produkOulet,
      {this.assignProductId, super.key});

  @override
  State<DetailProdukOutletView> createState() => _DetailProdukOutletViewState();
}

class _DetailProdukOutletViewState extends State<DetailProdukOutletView> {
  TextEditingController searchController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductOutletBloc>(
      create: (context) => ProductOutletBloc()
        ..add(ProductOutletEvent.detailProduct(
            outletId: widget.idOutlet.toString(),
            productId: widget.produkOulet.productId!,
            userId: widget.produkOulet.userId!,
            dateToday:
                DateFormat("yyyy-MM-dd").format(DateTime.now()).toString())),
      child: DetailProdukOutletBody(
          outletId: widget.idOutlet, assignProductId: widget.assignProductId),
    );
  }
}
