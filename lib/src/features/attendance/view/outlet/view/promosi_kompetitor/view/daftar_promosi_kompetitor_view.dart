import 'dart:convert';

import 'package:absensi_app/Api.dart';
import 'package:absensi_app/config.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/bloc/promo_competitor_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/daftar_promosi_kompetitor_body.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/detail_promosi_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/search_promosi_kompetitor.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/tambah_promosi_kompetitor.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:absensi_app/widgets/common/bottom_select_option.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaftarPromosiKompetitorView extends StatefulWidget {
  final int id_outlet;

  const DaftarPromosiKompetitorView(this.id_outlet, {super.key});

  @override
  State<DaftarPromosiKompetitorView> createState() =>
      _DaftarPromosiKompetitorViewState();
}

class _DaftarPromosiKompetitorViewState
    extends State<DaftarPromosiKompetitorView> {
  @override
  initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoCompetitorBloc>(
        create: (context) => PromoCompetitorBloc()
          ..add(PromoCompetitorEvent.getPromoCompetitor(
              FormData.fromMap({"id_outlet": widget.id_outlet.toString()}))),
        child: Scaffold(
            body: BlocBuilder<PromoCompetitorBloc, PromoCompetitorState>(
          builder: (context, state) {
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: state.whenOrNull(
                  loading: () => LoadingForm(context, true),
                  competitorPromos: (data) {
                    return DaftarPromosiKompetitorBody(widget.id_outlet, data);
                  },
                ));
          },
        )));
  }
}
