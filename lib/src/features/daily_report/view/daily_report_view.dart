import 'package:absensi_app/src/core/api/state_wrapper_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../widgets/common/back_button.dart';
import '../../../network/data/resource/resource_repository.dart';
import '../../../network/domain_manager.dart';
import '../../../network/model/daily_report/daily_report.dart';
import '../../auth/logic/auth_bloc.dart';
import '../../common/resource/view/resource_view.dart';
import '../widget/daily_report_item.dart';
import '../widget/daily_report_item_shimmer.dart';
import 'form/daily_report_form.dart';

class DailyReportView extends StatefulWidget {
  const DailyReportView({Key? key}) : super(key: key);

  @override
  State<DailyReportView> createState() => _DailyReportViewState();
}

class _DailyReportViewState extends State<DailyReportView> {
  late ResourceRepository<DailyReport> _repository;
  final _pagingController = PagingController<int, DailyReport>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _repository = GetIt.I<DomainManager>().dailyReportRepository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          'Laporan Kerja',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(loggedIn: (_) {
            _pagingController.refresh();
          });
        },
        child: ResourceView<DailyReport, DailyReportRequest>(
          title: 'Laporan Kerja',
          repository: _repository,
          pagingController: _pagingController,
          primaryKey: (v) => v.id,
          firstPageProgressIndicatorBuilder: _progressIndicatorBuilder,
          noItemsFoundIndicatorBuilder: _noItemsFoundIndicatorBuilder(),
          itemBuilder: (item, _) => XDailyReportItem(data: item),
          formBuilder: (DailyReport? item) => DailyReportForm(
            initialData: item,
          ),
          withAppBar: false,
        ),
      ),
    );
  }

  Widget _progressIndicatorBuilder(_) => const XDailyReportItemShimmer();

  StateWrapperArgument _noItemsFoundIndicatorBuilder() {
    return const StateWrapperArgument(
      title: "Data Laporan Kerja Kosong",
      description:
          "Kamu tidak memiliki Laporan Kerja saat ini. Silahkan buat Laporan Kerja baru dengan menekan tombol dibawah ini.",
      // icon: XPreloadLottieAsset(
      //   lottiePath: Assets.lotties.schedule,
      // ),
    );
  }
}
