import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';

// import '../../../config/constants/keys.dart';
// import '../../../network/model/user/user.dart';
// import '../../../services/auth_service.dart';
import 'pending_status_view.dart';

class UserVerificationView extends StatefulWidget {
  const UserVerificationView({
    Key? key,
    this.onResult,
  }) : super(key: key);

  final Function(bool)? onResult;

  @override
  State<UserVerificationView> createState() => _UserVerificationViewState();
}

class _UserVerificationViewState extends State<UserVerificationView> {
  // late ValueNotifier<User> _user;

  // final GetStorage box = GetStorage();

  // @override
  // void initState() {
  //   super.initState();
  //   _user = ValueNotifier<User>(Auth.instance.user!);
  //   _onUserDataOnChanged();
  // }

  // void _onUserDataOnChanged() {
  //   box.listenKey(XKeys.userData, (user) {
  //     if (mounted) {
  //       _user.value = user;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PedingStatusView(),
      ),
    );
  }
}
