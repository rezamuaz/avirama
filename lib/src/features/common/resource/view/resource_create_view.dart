import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/body/cud_app_bar.dart';
import '../../../../../widgets/common/bottom_sheet.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/data/resource/resource_repository.dart';
import '../logic/resource_bloc.dart';

class ResourceCreateViewArguments<ItemType, RequestType> {
  final String title;
  final ResourceRepository<ItemType> repository;
  final int Function(ItemType) primaryKey;
  final Widget formBuilder;
  final Function(ItemType)? onCreated;

  ResourceCreateViewArguments({
    required this.title,
    required this.repository,
    required this.primaryKey,
    required this.formBuilder,
    this.onCreated,
  });
}

class ResourceCreateView<ItemType, RequestType> extends StatelessWidget {
  const ResourceCreateView({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ResourceCreateViewArguments<ItemType, RequestType> args;

  static show<ItemType, RequestType>({
    required ResourceCreateViewArguments<ItemType, RequestType> args,
  }) {
    XBottomSheet.show(
      ResourceCreateView<ItemType, RequestType>(
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
                return CudAppBar(
                  title: S.text.common_create(args.title),
                );
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
      stored: (item) => args.onCreated?.call(item),
    );
  }
}
