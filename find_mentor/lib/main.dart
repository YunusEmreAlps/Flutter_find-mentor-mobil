// Find Mentor & Mentees Network
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/util/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// UI
import 'package:find_mentor/page/splash/splash_page.dart';
import 'package:find_mentor/page/home/home_navigator.dart';


void main() => runApp(FindMentor());

class FindMentor extends StatefulWidget {
  @override
  _FindMentorState createState() => _FindMentorState();
}

class _FindMentorState extends State<FindMentor> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: AppConstant.appName,
      debugShowCheckedModeBanner: false,
      // Internationalization
      supportedLocales: [Locale("en"), Locale("tr")],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppConstant.pageSplash,
      routes: {
        AppConstant.pageSplash: (context) => SplashPage(),
        AppConstant.pageHome: (context) => HomeNavigator(),
      },
    );
  }
}
