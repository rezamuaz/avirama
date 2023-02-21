import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/state_wrapper_argument.dart';
import 'package:absensi_app/src/dialogs/state_wrapper_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../widgets/body/custom_paged_list_view.dart';
import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/data/resource/resource_repository.dart';
import '../../../../theme/colors.dart';
import '../widget/resource_item.dart';
import 'resource_create_view.dart';
import 'resource_edit_view.dart';

class ResourceView<ItemType, RequestType> extends StatefulWidget {
  const ResourceView({
    Key? key,
    required this.title,
    required this.repository,
    required this.primaryKey,
    required this.itemBuilder,
    required this.formBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    required this.pagingController,
    this.withAppBar = true,
    this.withDeleteButton = true,
  }) : super(key: key);

  final String title;
  final bool withAppBar;
  final int Function(ItemType) primaryKey;
  final ResourceRepository<ItemType> repository;
  final Widget Function(ItemType, int) itemBuilder;
  final Widget Function(BuildContext)? firstPageProgressIndicatorBuilder;
  final bool withDeleteButton;
  final StateWrapperArgument? noItemsFoundIndicatorBuilder;
  final Widget Function(ItemType?) formBuilder;
  final PagingController<int, ItemType> pagingController;

  @override
  State<ResourceView<ItemType, RequestType>> createState() =>
      _ResourceViewState<ItemType, RequestType>();
}

class _ResourceViewState<ItemType, RequestType>
    extends State<ResourceView<ItemType, RequestType>> {
  late PagingController<int, ItemType> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = widget.pagingController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.withAppBar
          ? AppBar(
              leading: const XBackButton(),
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _showCreateView,
                ),
              ],
            )
          : null,
      body: _buildBody(),
      floatingActionButton: !widget.withAppBar ? _floatingActionButton() : null,
    );
  }

  Future<void> _showCreateView() async {
    ResourceCreateView.show(
      args: ResourceCreateViewArguments<ItemType, RequestType>(
        title: widget.title,
        formBuilder: widget.formBuilder.call(null),
        primaryKey: widget.primaryKey,
        repository: widget.repository,
        onCreated: _onCreated,
      ),
    );
  }

  Future<void> _showUpdateView(ItemType item) async {
    ResourceEditView.show(
      args: ResourceEditViewArguments<ItemType, RequestType>(
        title: widget.title,
        formBuilder: widget.formBuilder.call(item),
        item: item,
        primaryKey: widget.primaryKey,
        repository: widget.repository,
        onUpdated: _onUpdated,
        onDeleted: _onDeleted,
        deleteArgument: widget.withDeleteButton,
      ),
    );
  }

  Widget _itemBuilder(context, item, index) {
    return ResourceItem<ItemType>(
      index: index,
      item: item,
      onTap: _showUpdateView,
      itemBuilder: widget.itemBuilder,
      separatorPadding: const EdgeInsets.only(
        bottom: Constants.kPaddingS,
      ),
    );
  }

  Widget _buildBody() {
    return XPagedListView<int, ItemType>(
      pagingController: _pagingController,
      nexPageKey: (int pageKey) => pageKey + 1,
      repository: (
        pageKey,
      ) =>
          widget.repository.index(pageNumber: pageKey),
      firstPageProgressIndicatorBuilder:
          widget.firstPageProgressIndicatorBuilder,
      noItemsFoundIndicatorBuilder: _noItemsFoundIndicatorBuilder(),
      itemBuilder: _itemBuilder,
    );
  }

  Widget? _noItemsFoundIndicatorBuilder() {
    return widget.noItemsFoundIndicatorBuilder != null
        ? StateWrapperWidget(
            args: widget.noItemsFoundIndicatorBuilder!.copyWith(
              onButtonTap: _showCreateView,
              buttonLabel: S.text.common_add,
            ),
          )
        : null;
  }

  Widget _floatingActionButton() {
    return FloatingActionButton.extended(
      heroTag: widget.repository.hashCode,
      backgroundColor: XColors.white,
      onPressed: _showCreateView,
      icon: const Icon(
        Icons.add,
        color: XAppColors.primary,
      ),
      label: Text(
        S.text.common_add,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: XAppColors.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  void _onCreated(ItemType item) {
    _pagingController.refresh();
  }

  void _onUpdated(ItemType item) {
    _pagingController.refresh();
  }

  void _onDeleted(ItemType item) {
    _pagingController.refresh();
  }
}
