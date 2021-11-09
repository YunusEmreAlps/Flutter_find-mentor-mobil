// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    final isOK = await canLaunch(link);
    if (isOK) {
      launch(link);
    }
  }

  // URL
  static void launchURL(String url) async {
    if (url == null) {
      return;
    }
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw AppStrings.WEB_ERROR;
      }
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  static String jobTimeCreatedAt(String value){
    var list = value.split(".");
    var yy = int.parse(list.last);
    var dt = int.parse(list[0]);
    var mm = toMonthIndex(list[1]);
    final date = DateTime(yy,mm,dt);
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
      msg = dur.inDays == 1 ? '${dur.inDays} day ago' : '${dur.inDays} days ago';
    } else if (dur.inHours > 0) {
      msg = dur.inHours == 1 ? '${dur.inHours} hour ago' : '${dur.inHours} hours ago';
    } else if (dur.inMinutes > 0) {
      msg = dur.inMinutes == 1 ? '${dur.inMinutes} minute ago' : '${dur.inMinutes} minutes ago';
    } else if (dur.inSeconds > 0) {
      msg = dur.inSeconds == 1 ? '${dur.inSeconds} second ago' : '${dur.inSeconds} seconds ago';
    } else {
      msg = 'now';
    }
    return msg;
  }

  static int toMonthIndex(String value){
    switch (value) {
      case "Jan": return 1;
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
    }
  }
}
