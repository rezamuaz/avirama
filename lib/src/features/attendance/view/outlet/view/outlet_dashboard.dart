import 'package:absensi_app/src/features/attendance/view/outlet/bloc/bloc/outlet_info_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_kompetitor/view/daftar_produk_kompetitor_view.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/produk_outlet/view/daftar_produk_outlet_view.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/promosi_kompetitor/view/daftar_promosi_kompetitor_view.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/widget/button_menu.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/jadwal_kunjungan/jadwal_kunjungan_view.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutletDashboardView extends StatefulWidget {
  final int? id_outlet;

  const OutletDashboardView(this.id_outlet, {super.key});

  @override
  State<OutletDashboardView> createState() => _OutletDashboardViewState();
}

class _OutletDashboardViewState extends State<OutletDashboardView> {
  bool loading = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OutletInfoBloc>(
      create: (context) => OutletInfoBloc()
        ..add(OutletInfoEvent.getOutletInfo({"id": widget.id_outlet})),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Outlet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
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
        body: Builder(builder: (context) {
          return BlocBuilder<OutletInfoBloc, OutletInfoState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => LoadingForm(context, true),
                  isLoading: () => LoadingForm(context, true),
                  outletInfo: (data) => Container(
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: RefreshIndicator(
                          onRefresh: () async =>
                              BlocProvider.of<OutletInfoBloc>(context)
                                ..add(OutletInfoEvent.getOutletInfo(
                                    {"id": widget.id_outlet})),
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 24),
                                const Text(
                                  'Outlet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  'Anda sudah aktif absen di outlet',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: XAppColors.grey,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: XAppColors.green),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                            color: XAppColors.green,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                            )),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          color: XAppColors.greenMuda,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/ic_outlet.png",
                                            height: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: SizedBox(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.dataOutlet!.name ?? "",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: XAppColors.grey,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      data.dataOutlet!
                                                              .address ??
                                                          "",
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: XAppColors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Buka 09:00 - 21:00',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: XAppColors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Summary',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                butonMenu(
                                    'Total Produk',
                                    '${data.product} Produk',
                                    "assets/images/ic_produk.png",
                                    XAppColors.biru1, () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              DaftarProdukOutletView(
                                                  widget.id_outlet!)));
                                }),
                                const SizedBox(height: 6),
                                butonMenu(
                                    'Total Kompetitor',
                                    '${data.competitor} Kompetitor',
                                    "assets/images/ic_kompetitor.png",
                                    XAppColors.greenAccent, () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              DaftarProdukKompetitorView(
                                                  widget.id_outlet!)));
                                }),
                                const SizedBox(height: 6),
                                butonMenu(
                                    'Jadwal Kunjungan',
                                    '${data.kunjungan} Jadwal',
                                    "assets/images/ic_jadwal.png",
                                    XAppColors.orange, () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const JadwalKunjunganView()));
                                }),
                                const SizedBox(height: 6),
                                butonMenu(
                                    'Total Harga Promo Kompetitor Terbaru',
                                    '${data.promo} Harga Promo',
                                    "assets/images/ic_reload.png",
                                    XAppColors.pink, () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              DaftarPromosiKompetitorView(
                                                  widget.id_outlet!)));
                                }),
                              ],
                            ),
                          ),
                        ),
                      ));
            },
          );
        }),
      ),
    );
  }
}
