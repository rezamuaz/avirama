import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/account_setting_bloc.dart';

class AccountSettingWrapperView extends StatelessWidget {
  const AccountSettingWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountSettingBloc(),
      child: const AutoRouter(),
    );
  }
}
