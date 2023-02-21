import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:get_storage/get_storage.dart';

import '../../../dialogs/alert_wrapper.dart';
import '../../../network/model/user/user.dart';
import '../../../services/auth_service.dart';

enum Roles {
  mentor,
}

void showSuccessDialogMentor() {
  final sh = GetStorage().read('#showDialogMentor');
  if (isNullOrEmpty(sh) || sh == true) {
    // delay for 1 second
    Future.delayed(const Duration(seconds: 1), () {
      XAlert.show(
        title: 'Selamat Anda telah terverifikasi sebagai mentor',
      );
    });

    GetStorage().write('#showDialogMentor', false);
  }
}

bool verifyUserValidator({bool decludeHasMentor = false}) {
  User user = Auth.instance.user!;

  return user.status != 'pending';
}
