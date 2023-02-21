import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/constants/screen.dart';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/core/api/state_content_type.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/widgets/common/indicator.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../../src/network/model/common/pagination_type.dart';

enum PagedListViewType {
  list,
  grid,
}

class XPagedListView<PageKeyType, ItemType> extends StatefulWidget {
  const XPagedListView({
    Key? key,
    required this.pagingController,
    required this.repository,
    required this.nexPageKey,
    required this.itemBuilder,
    this.scrollController,
    this.firstPageProgressIndicatorBuilder,
    this.type = PagedListViewType.list,
    this.onNoItemsFound,
    this.noItemsFoundIndicatorBuilder,
    this.physics,
  }) : super(key: key);

  final PagingController<PageKeyType, ItemType> pagingController;
  final ScrollController? scrollController;
  final Widget Function(BuildContext, ItemType, int) itemBuilder;
  final Future<ApiResult<PaginationType<ItemType>>> Function(PageKeyType)
      repository;
  final Widget Function(BuildContext)? firstPageProgressIndicatorBuilder;

  final PageKeyType Function(PageKeyType) nexPageKey;
  final PagedListViewType type;
  final VoidCallback? onNoItemsFound;
  final Widget? noItemsFoundIndicatorBuilder;
  final ScrollPhysics? physics;

  @override
  State<XPagedListView<PageKeyType, ItemType>> createState() =>
      _XPagedListViewState<PageKeyType, ItemType>();
}

class _XPagedListViewState<PageKeyType, ItemType>
    extends State<XPagedListView<PageKeyType, ItemType>> {
  @override
  void initState() {
    super.initState();
    widget.pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    widget.scrollController?.addListener(() {
      if (widget.scrollController?.offset == 0 &&
          widget.scrollController?.position.pixels ==
              widget.scrollController?.position.maxScrollExtent) {
        if (widget.scrollController?.appBar != null) {
          if (!widget.scrollController!.appBar.isPinned) {
            widget.scrollController!.appBar.heightNotifier.value = 1.0;
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController?.dispose();
    widget.pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.pagingController.refresh(),
      child: widget.type == PagedListViewType.list
          ? PagedListView<PageKeyType, ItemType>(
              pagingController: widget.pagingController,
              scrollController: widget.scrollController,
              physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(Constants.kPaddingL),
              builderDelegate: _pagedChildBuilderDelegate(),
            )
          : PagedGridView<PageKeyType, ItemType>(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: XScreens.width / 2 -
                            (Constants.kFontSizeL * 2 + Constants.kPaddingS) >
                        178
                    ? 3
                    : 2,
                crossAxisSpacing: Constants.kPaddingS,
                mainAxisSpacing: Constants.kPaddingS,
                childAspectRatio: 0.75,
              ),
              physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
              pagingController: widget.pagingController,
              scrollController: widget.scrollController,
              padding: const EdgeInsets.all(Constants.kPaddingL),
              builderDelegate: _pagedChildBuilderDelegate(),
            ),
    );
  }

  PagedChildBuilderDelegate<ItemType> _pagedChildBuilderDelegate() {
    return PagedChildBuilderDelegate<ItemType>(
      newPageProgressIndicatorBuilder: (context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: Constants.kPaddingL),
        child: XIndicator(),
      ),
      firstPageProgressIndicatorBuilder:
          widget.firstPageProgressIndicatorBuilder,
      firstPageErrorIndicatorBuilder: (_) => StateWidget.error(
        error: widget.pagingController.error,
        onRetry: () => widget.pagingController.refresh(),
      ),
      newPageErrorIndicatorBuilder: (_) => StateWidget.error(
        error: widget.pagingController.error,
        onRetry: () => widget.pagingController.retryLastFailedRequest(),
        stateContentType: StateContentType.section,
      ),
      noItemsFoundIndicatorBuilder: (_) =>
          widget.noItemsFoundIndicatorBuilder ??
          StateWidget.noData(
            onRetry: widget.onNoItemsFound ??
                () => widget.pagingController.refresh(),
          ),
      itemBuilder: widget.itemBuilder,
    );
  }

  Future<void> _fetchPage(PageKeyType pageKey) async {
    try {
      final ApiResult<PaginationType<ItemType>> apiResult =
          await widget.repository.call(pageKey);

      if (mounted) {
        apiResult.when(
          success: (PaginationType<ItemType> data) {
            if (data.links?.next != null) {
              widget.pagingController.appendPage(
                data.data!,
                widget.nexPageKey.call(pageKey),
              );
            } else {
              widget.pagingController.appendLastPage(data.data!);
            }
          },
          failure: (NetworkExceptions error) {
            widget.pagingController.error = error;
          },
        );
      }
    } catch (e) {
      if (mounted) widget.pagingController.error = e.toString();
    }
  }
}
