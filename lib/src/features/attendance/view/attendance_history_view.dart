import 'dart:developer';
import 'package:absensi_app/gen/assets.gen.dart';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/outlet/view/outlet_dashboard.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/date_range_picker.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import '../../../../../widgets/common/back_button.dart';
import '../../../network/model/attendance/attendance.dart';

class AttendanceHistoryView extends StatefulWidget {
  const AttendanceHistoryView({super.key});

  @override
  State<AttendanceHistoryView> createState() => _AttendanceHistoryViewState();
}

class _AttendanceHistoryViewState extends State<AttendanceHistoryView> {
  final scrollController = ScrollController();

  final PagingController<int, Attendance> _pagingController = PagingController(
    firstPageKey: 1,
  );

  String? tanggal_awal;
  String? tanggal_akhir;
  String? range;
  bool loading = true;
  bool loadData = true;

  void pageRequest() {
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<AttendanceBloc>(context).add(
          AttendanceEvent.attendanceList(
              page: pageKey, startDate: tanggal_awal, endDate: tanggal_akhir));
    });
  }

  @override
  void initState() {
    tanggal_awal = DateFormat("yyyy-MM-dd").format(DateTime.now());
    tanggal_akhir = DateFormat("yyyy-MM-dd").format(DateTime.now());
    range =
        "${DateFormat("yyyy/MM/dd").format(DateTime.now())} - ${DateFormat("yyyy/MM/dd").format(DateTime.now())}";
    pageRequest();
    super.initState();
  }

  void refreshIndicator() {
    log('refreshIndicator');
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => refreshIndicator(),
      child: Scaffold(
        appBar: AppBar(
          leading: const XBackButton(),
          title: Text(
            'Riwayat Absensi',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(children: [
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (con) => DateRangePicker(
                    tanggal_awal: tanggal_awal,
                    tanggal_akhir: tanggal_akhir,
                    range: range,
                  )).then((value) {
            if (value != null) {
              tanggal_awal = value['tanggal_awal'];
              tanggal_akhir = value['tanggal_akhir'];
              range = value['range'];
              setState(() {
                _pagingController.refresh();
                loading = true;
              });
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: XAppColors.green),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 22,
                color: XAppColors.grey,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  range!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: BlocListener<AttendanceBloc, AttendanceState>(
          listener: (context, state) {
            state.maybeWhen(
                isLoading: () =>
                    const Center(child: CircularProgressIndicator()),
                loadedAttendances: (attendance) {
                  if (attendance!.nextPage == 0) {
                    return _pagingController.appendLastPage(attendance.data!);
                  }
                  return _pagingController.appendPage(
                      attendance.data!, attendance.currentPage! + 1);
                },
                orElse: () => Container());
          },
          child: PagedListView<int, Attendance>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) {
                  bool aktifAbsen = false;
                  bool absenSelesai = false;
                  String durasi = "-";

                  if (item.checkInt != null && item.checkOut == null) {
                    if (item.date ==
                        DateFormat('yyyy-MM-dd').format(DateTime.now())) {
                      aktifAbsen = true;
                    }
                  }
                  if (item.checkInt != null && item.checkOut != null) {
                    absenSelesai = true;
                  }
                  if (absenSelesai) {
                    String tgl_start =
                        "${DateFormat("yyyy-MM-dd").format(DateTime.now())} ${item.checkInt}:00";
                    String tgl_end =
                        "${DateFormat("yyyy-MM-dd").format(DateTime.now())} ${item.checkOut}:00";
                    durasi = calculateTimeDifferenceBetween(
                        startDate: DateTime.parse(tgl_start),
                        endDate: DateTime.parse(tgl_end));
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.kPaddingL),
                    child: Card(
                      elevation: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.kPaddingL),
                        child: Column(
                          children: [
                            outletInfo(context, item),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Absen Masuk',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  '${item.date} ${item.checkInt ?? ''}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const Divider(),
                            if (aktifAbsen == false)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Absen Keluar',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    (absenSelesai)
                                        ? '${item.date} ${item.checkOut ?? ''}'
                                        : "-",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            if (aktifAbsen == false) const Divider(),
                            if (aktifAbsen == false)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Durasi',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    durasi,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            if (aktifAbsen == false) const Divider(),
                            const SizedBox(height: Constants.kPaddingS),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Koordinat Absent',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '${item.dataOutlet.lang}, ${item.dataOutlet.long}',
                                    overflow: TextOverflow.clip,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Constants.kPaddingS),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status Absen',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  absenSelesai
                                      ? 'Sudah Absen'
                                      : aktifAbsen
                                          ? 'Aktif Absen'
                                          : 'Belum Absensi',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: absenSelesai
                                            ? XAppColors.greenAccent
                                            : aktifAbsen
                                                ? XAppColors.yellow
                                                : Colors.red,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Constants.kPaddingL),
                            aktifAbsen
                                ? XButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => OutletDashboardView(
                                                item.dataOutlet.id))),
                                    // onPressedMasukOutlet(attendance[index]),
                                    backgroundColor: XAppColors.greenAccent,
                                    title: 'Masuk outlet',
                                    withHorizontalPadding: true,
                                  )
                                : Container(),
                            const SizedBox(height: Constants.kPaddingL),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    ]);
  }

  Widget outletInfo(BuildContext context, Attendance attendance) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Assets.svgs.smallOutletIcon.svg(),
          const SizedBox(width: Constants.kPaddingL),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendance.outlet,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                FittedBox(
                  child: AutoSizeText(
                    attendance.dataOutlet.address,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static String calculateTimeDifferenceBetween(
      {required DateTime startDate, required DateTime endDate}) {
    var duration = endDate.difference(startDate);
    String sDuration =
        "${duration.inHours == 0 ? "" : duration.inHours} ${duration.inHours == 0 ? "" : "jam"} ${duration.inMinutes.remainder(60) == 0 ? "" : duration.inMinutes.remainder(60)} ${duration.inMinutes.remainder(60) == 0 ? "" : "menit"} ${(duration.inSeconds.remainder(60) == 0 ? "" : duration.inSeconds.remainder(60))} ${duration.inSeconds.remainder(60) == 0 ? "" : "detik"}";
    return sDuration;
  }
}

// class XAttendanceHistoryItem extends StatelessWidget {
//   const XAttendanceHistoryItem({super.key, required this.attendance});
//   final ListAttendance attendance;
//   void onPressedMasukOutlet(Attendance attendance) {
//     XCoordinator.rootRouter.push(AttendanceRouters(
//         children: [AttendanceReviewRoute(attendance: attendance)]));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: attendance.data!.length,
//       itemBuilder: (context, index) {
//         bool aktifAbsen = false;
//         bool absenSelesai = false;
//         String durasi = "-";

//         if (attendance.data![index].checkInt != null &&
//             attendance.data![index].checkOut == null) {
//           if (attendance.data![index].date ==
//               DateFormat('d MMM, y').format(DateTime.now())) {
//             aktifAbsen = true;
//           }
//         }
//         if (attendance.data![index].checkInt != null &&
//             attendance.data![index].checkOut != null) {
//           absenSelesai = true;
//         }
//         if (absenSelesai) {
//           String tgl_start =
//               "${DateFormat("yyyy-MM-dd").format(DateTime.now())} ${attendance.data![index].checkInt}:00";
//           String tgl_end =
//               "${DateFormat("yyyy-MM-dd").format(DateTime.now())} ${attendance.data![index].checkOut}:00";
//           durasi = calculateTimeDifferenceBetween(
//               startDate: DateTime.parse(tgl_start),
//               endDate: DateTime.parse(tgl_end));
//         }

//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
//           child: Card(
//             elevation: 1,
//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
//               child: Column(
//                 children: [
//                   outletInfo(context, attendance.data![index]),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Absen Masuk',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       Text(
//                         '${attendance.data![index].date} ${attendance.data![index].checkInt ?? ''}',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                     ],
//                   ),
//                   const Divider(),
//                   if (aktifAbsen == false)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Absen Keluar',
//                           style: Theme.of(context).textTheme.bodySmall,
//                         ),
//                         Text(
//                           (absenSelesai)
//                               ? '${attendance.data![index].date} ${attendance.data![index].checkOut ?? ''}'
//                               : "-",
//                           style: Theme.of(context).textTheme.bodySmall,
//                         ),
//                       ],
//                     ),
//                   if (aktifAbsen == false) const Divider(),
//                   if (aktifAbsen == false)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Durasi',
//                           style: Theme.of(context).textTheme.bodySmall,
//                         ),
//                         Text(
//                           durasi,
//                           style: Theme.of(context).textTheme.bodySmall,
//                         ),
//                       ],
//                     ),
//                   if (aktifAbsen == false) const Divider(),
//                   const SizedBox(height: Constants.kPaddingS),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Koordinat Absen',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       Text(
//                         '${attendance.data![index].dataOutlet.lang}, ${attendance.data![index].dataOutlet.long}',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: Constants.kPaddingS),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Status Absen',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       Text(
//                         absenSelesai
//                             ? 'Sudah Absen'
//                             : aktifAbsen
//                                 ? 'Aktif Absen'
//                                 : 'Belum Absensi',
//                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                               color: absenSelesai
//                                   ? XAppColors.greenAccent
//                                   : aktifAbsen
//                                       ? XAppColors.yellow
//                                       : Colors.red,
//                             ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: Constants.kPaddingL),
//                   aktifAbsen
//                       ? XButton(
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (_) => OutletDashboardView(
//                                       attendance.data![index].dataOutlet.id))),
//                           // onPressedMasukOutlet(attendance[index]),
//                           backgroundColor: XAppColors.greenAccent,
//                           title: 'Masuk outlet',
//                           withHorizontalPadding: true,
//                         )
//                       : Container(),
//                   const SizedBox(height: Constants.kPaddingL),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget outletInfo(BuildContext context, Attendance attendance) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       child: Row(
//         children: [
//           Assets.svgs.smallOutletIcon.svg(),
//           const SizedBox(width: Constants.kPaddingL),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   attendance.outlet,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//                 FittedBox(
//                   child: AutoSizeText(
//                     attendance.dataOutlet.address,
//                     style: Theme.of(context).textTheme.bodySmall,
//                     maxLines: 3,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   static String calculateTimeDifferenceBetween(
//       {required DateTime startDate, required DateTime endDate}) {
//     int seconds = endDate.difference(startDate).inSeconds;
//     if (seconds < 60) {
//       return '$seconds detik';
//     } else if (seconds >= 60 && seconds < 3600) {
//       return '${startDate.difference(endDate).inMinutes.abs()} menit';
//     } else if (seconds >= 3600 && seconds < 86400) {
//       return '${startDate.difference(endDate).inHours} jam';
//     } else {
//       return '${startDate.difference(endDate).inDays} hari';
//     }
//   }
// }



// class XAttendanceHistoryItem extends StatelessWidget {
//   const XAttendanceHistoryItem({equired this.attendance});
//   final List<Attendance> attendance;

//   // _goToAttendanceInView() {
//   //   XCoordinator.rootRouter
//   //       .push(AttendanceRouters(children: [AttendanceInRoute(item: item)]));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return XCard(
//       margin: EdgeInsets.zero,
//       child: GestureDetector(
//         // onTap: _goToAttendanceInView,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Assets.svgs.outlet.svg(height: 64),
//             const SizedBox(
//               height: Constants.kPaddingS,
//             ),
//             Text(
//               attendance.,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   ?.copyWith(color: XAppColors.primary),
//             ),
//             const SizedBox(height: Constants.kPaddingXS),
//             AutoSizeText(
//               item.date,
//               style: Theme.of(context).textTheme.bodySmall,
//               maxLines: 5,
//               textAlign: TextAlign.center,
//               minFontSize: Constants.kFontSizeXS,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
