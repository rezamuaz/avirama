import 'package:timeago/timeago.dart' as timeago;

class XTimeAgo {
  static String parse(String date) {
    return timeago.format(
      DateTime.parse(date),
    );
  }
}
