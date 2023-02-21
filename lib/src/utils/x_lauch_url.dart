import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../router/coordinator.dart';

Future<void> xlaunchUrl(dynamic url, {LaunchMode? mode}) async {
  late Uri uri;

  if (url is String) {
    uri = Uri.parse(url);
  } else if (url is Uri) {
    uri = url;
  } else {
    throw 'url must be String or Uri';
  }

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: mode ?? LaunchMode.externalApplication,
    );
  } else {
    FlashMessage.error(
      context: XCoordinator.context,
      message: "can't open url: $url",
    );
  }
}
