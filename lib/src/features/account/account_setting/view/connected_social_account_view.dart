import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../widgets/body/custom_paged_list_view.dart';
import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/domain_manager.dart';
import '../../../../network/model/account_setting/social_account/social_account.dart';
import '../../../../network/model/common/pagination_type.dart';
import '../logic/account_setting_bloc.dart';
import '../widgets/add_social_account_floating_button.dart';
import '../widgets/social_account_item.dart';
import '../widgets/social_account_item_shimmer.dart';

class ConnectedSocialAccountView extends StatefulWidget {
  const ConnectedSocialAccountView(
      {Key? key, this.onlyFavorited, this.initialSearch})
      : super(key: key);

  final bool? onlyFavorited;
  final String? initialSearch;

  @override
  State<ConnectedSocialAccountView> createState() =>
      _ConnectedSocialAccountViewState();
}

class _ConnectedSocialAccountViewState
    extends State<ConnectedSocialAccountView> {
  final scrollController = ScrollController();

  final PagingController<int, SocialAccount> _pagingController =
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
          S.text.connected_accounts,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: _buildBody(),
      floatingActionButton: const XAddSocialAccountFloatingButton(),
    );
  }

  Widget _buildBody() {
    return BlocListener<AccountSettingBloc, AccountSettingState>(
      listener: _blocListener,
      child: XPagedListView<int, SocialAccount>(
        scrollController: scrollController,
        pagingController: _pagingController,
        repository: _repository,
        nexPageKey: (int pageKey) => pageKey + 1,
        firstPageProgressIndicatorBuilder: (_) =>
            const XSocialAccountItemShimmer(),
        itemBuilder: (context, item, index) => XSocialAccountItem(
          separatorPadding: const EdgeInsets.only(
            bottom: Constants.kPaddingM,
          ),
          socialAccount: item,
        ),
      ),
    );
  }

  Future<ApiResult<PaginationType<SocialAccount>>> _repository(
    int pageKey,
  ) async {
    return await GetIt.I<DomainManager>()
        .accountSettingRepository
        .socialAccount(pageNumber: pageKey);
  }

  void _blocListener(context, state) {
    state.whenOrNull(
      isError: (e) {
        hideLoading();
        FlashMessage.error(context: context, error: e);
      },
      isLoading: () => showLoading(context),
      success: (_) {
        XToast.show(S.text.common_success);
        _refresh();
      },
      successAddSocialAccount: (_) {
        XToast.show(S.text.common_success);
        _refresh();
      },
    );
  }

  Future<void> _refresh() async {
    hideLoading();
    _pagingController.refresh();
  }
}
