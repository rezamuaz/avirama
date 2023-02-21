import 'package:absensi_app/gen/assets.gen.dart';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../widgets/body/custom_paged_list_view.dart';
import '../../../../../widgets/common/back_button.dart';
import '../../../../widgets/common/card.dart';
import '../../../network/domain_manager.dart';
import '../../../network/model/common/pagination_type.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';

class SelectOutletView extends StatefulWidget {
  const SelectOutletView({Key? key, this.onlyFavorited, this.initialSearch})
      : super(key: key);

  final bool? onlyFavorited;
  final String? initialSearch;

  @override
  State<SelectOutletView> createState() => _SelectOutletViewState();
}

class _SelectOutletViewState extends State<SelectOutletView> {
  final scrollController = ScrollController();

  final PagingController<int, SelectOutlet> _pagingController =
      PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          'Pilih Outlet',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return XPagedListView<int, SelectOutlet>(
      type: PagedListViewType.grid,
      scrollController: scrollController,
      pagingController: _pagingController,
      repository: _repository,
      nexPageKey: (int pageKey) => pageKey + 1,
      itemBuilder: (context, item, index) => XSelectOutletItem(item: item),
    );
  }

  Future<ApiResult<PaginationType<SelectOutlet>>> _repository(
    int pageKey,
  ) async {
    return await GetIt.I<DomainManager>()
        .selectOutletRepository
        .index(pageNumber: pageKey);
  }
}

class XSelectOutletItem extends StatelessWidget {
  const XSelectOutletItem({super.key, required this.item});
  final SelectOutlet item;

  void _goToAttendanceInView() {
    XCoordinator.rootRouter
        .push(AttendanceRouters(children: [AttendanceInRoute(item: item)]));
  }

  @override
  Widget build(BuildContext context) {
    return XCard(
      margin: EdgeInsets.zero,
      child: GestureDetector(
        //ANCHOR - Check if user was attendance can't login to attendance page
        onTap: item.is_complete! ? () {} : _goToAttendanceInView,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svgs.outlet.svg(height: 64),
            const SizedBox(
              height: Constants.kPaddingS,
            ),
            Text(
              item.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: XAppColors.primary),
            ),
            const SizedBox(height: Constants.kPaddingXS),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: XAppColors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: AutoSizeText(
                      item.address,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      minFontSize: Constants.kFontSizeXS,
                    ),
                  ),
                ],
              ),
            ),
            if (item.is_complete!)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: XAppColors.greenAccent,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    AutoSizeText(
                      "Anda Sudah Absen",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: XAppColors.greenAccent,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      minFontSize: Constants.kFontSizeXS,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
