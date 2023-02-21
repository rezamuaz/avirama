import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/body/cud_app_bar.dart';
import '../../../../../widgets/common/bottom_sheet.dart';
import '../../../../dialogs/alert_wrapper.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/data/resource/resource_repository.dart';
import '../logic/resource_bloc.dart';

class ResourceEditViewArguments<ItemType, RequestType> {
  final String title;
  final ItemType item;
  final ResourceRepository<ItemType> repository;
  final Function(ItemType)? onUpdated;
  final Function(ItemType)? onDeleted;
  final bool deleteArgument;
  final int Function(ItemType) primaryKey;
  final Widget formBuilder;

  ResourceEditViewArguments({
    required this.title,
    required this.item,
    required this.repository,
    required this.primaryKey,
    required this.formBuilder,
    this.onUpdated,
    this.onDeleted,
    this.deleteArgument = true,
  });
}

class ResourceEditView<ItemType, RequestType> extends StatelessWidget {
  const ResourceEditView({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ResourceEditViewArguments<ItemType, RequestType> args;

  static show<ItemType, RequestType>({
    required ResourceEditViewArguments<ItemType, RequestType> args,
  }) {
    XBottomSheet.show(
      ResourceEditView<ItemType, RequestType>(
        args: args,
      ),
      withHorizontalPadding: false,
      withTopPadding: false,
      withTopBar: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResourceBloc<ItemType, RequestType>(
        args.repository,
      ),
      child: BlocListener<ResourceBloc<ItemType, RequestType>,
          ResourceState<ItemType>>(
        listener: _blocListener,
        child: Column(
          children: [
            BlocBuilder<ResourceBloc<ItemType, RequestType>,
                ResourceState<ItemType>>(
              builder: (context, state) {
                return args.deleteArgument
                    ? CudAppBar(
                        onDelete: () => _deleteConfirmation(context),
                        title: S.text.common_edit(args.title),
                      )
                    : Container();
              },
            ),
            const SizedBox(height: Constants.kPaddingS),
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  const SizedBox(height: Constants.kPaddingS),
                  args.formBuilder,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _blocListener(context, state) {
    state.whenOrNull(
      deleted: () {
        XBottomSheet.hide();
        args.onDeleted?.call(args.item);
      },
      stored: (item) => args.onUpdated?.call(item),
    );
  }

  Future<void> _deleteConfirmation(BuildContext context) async {
    bool alertConfirmation = await XAlert.onWillPop(
      S.text.are_you_sure_to_delete,
    );

    // ignore: use_build_context_synchronously
    if (alertConfirmation) _delete(context);
  }

  Future<void> _delete(BuildContext context) async {
    context.read<ResourceBloc<ItemType, RequestType>>().add(
          ResourceEvent<RequestType>.delete(
            args.primaryKey(args.item),
          ),
        );
  }
}
