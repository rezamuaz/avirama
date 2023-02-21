import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_act_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/bloc/competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/daftar_produk_kompetitor_body.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class DaftarProdukKompetitorView extends StatefulWidget {
  final int idOutlet;

  const DaftarProdukKompetitorView(this.idOutlet, {super.key});

  @override
  State<DaftarProdukKompetitorView> createState() =>
      _DaftarProdukKompetitorViewState();
}

class _DaftarProdukKompetitorViewState
    extends State<DaftarProdukKompetitorView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompetitorBloc>(
          create: (context) => CompetitorBloc()
            ..add(CompetitorEvent.getCompetitorProducts(
                widget.idOutlet.toString())),
        ),
        BlocProvider<CompetitorActBloc>(
            create: (context) => CompetitorActBloc()
              ..add(CompetitorActEvent.getCompetitorActivityAll(
                  {"id_outlet": widget.idOutlet.toString()}))),
      ],
      child: Scaffold(body: BlocBuilder<CompetitorBloc, CompetitorState>(
        builder: (context, state) {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: state.whenOrNull(
                isLoading: () => LoadingForm(context, true),
                competitorProducts: (data) {
                  return DaftarProdukKompetitorBody(widget.idOutlet, data);
                },
              ));
        },
      )),
    );
  }
}
