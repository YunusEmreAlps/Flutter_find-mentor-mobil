// Package imports:
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';

class Utility {
  Utility._internal();

  static String toDMYformate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String toformattedDate2(DateTime date) {
    return DateFormat('dd-MMM-yyyy hh:mm a').format(date);
  }

  static launchTo(String link) async {
    final isOK = await canLaunchUrl(Uri.parse(link));
    if (isOK) {
      launchUrl(Uri.parse(link));
    }
  }

  // URL
  static void launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw '${AppStrings.LAUNCH_ERROR}';
  }

  static String jobTimeCreatedAt(String value) {
    print(value);
    var list = value.split(".");
    var yy = int.parse(list.last);
    var dt = int.parse(list[0]);
    var mm = toMonthIndex(list[1]);
    final date = DateTime(yy, mm, dt);
    return getPassedTime(date.toIso8601String());
  }

  static String getPassedTime(String date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    String msg = '';
    var dt = DateTime.parse(date).toLocal();

    if (DateTime.now().toLocal().isBefore(dt)) {
      return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
    }

    var dur = DateTime.now().toLocal().difference(dt);
    if (dur.inDays > 0) {
      // msg = '${dur.inDays} days ago';
      msg =
          dur.inDays == 1 ? '${dur.inDays} day ago' : '${dur.inDays} days ago';
    } else if (dur.inHours > 0) {
      msg = dur.inHours == 1
          ? '${dur.inHours} hour ago'
          : '${dur.inHours} hours ago';
    } else if (dur.inMinutes > 0) {
      msg = dur.inMinutes == 1
          ? '${dur.inMinutes} minute ago'
          : '${dur.inMinutes} minutes ago';
    } else if (dur.inSeconds > 0) {
      msg = dur.inSeconds == 1
          ? '${dur.inSeconds} second ago'
          : '${dur.inSeconds} seconds ago';
    } else {
      msg = 'now';
    }
    return msg;
  }

  static int toMonthIndex(String value) {
    switch (value) {
      /*case "Jan": return 1;
      case "Feb": return 2;
      case "Mar": return 3;
      case "Apr": return 4;
      case "May": return 5;
      case "Jun": return 6;
      case "Jul": return 7;
      case "Aug": return 8;
      case "Sep": return 9;
      case "Oct": return 10;
      case "Nov": return 11;
      case "Dec": return 12;
      default: return 1;
      */
      case '01':
        return 1;
      case '02':
        return 2;
      case '03':
        return 3;
      case '04':
        return 4;
      case '05':
        return 5;
      case '06':
        return 6;
      case '07':
        return 7;
      case '08':
        return 8;
      case '09':
        return 9;
      case '10':
        return 10;
      case '11':
        return 11;
      case '12':
        return 12;
      default:
        return 1;
    }
  }
}
