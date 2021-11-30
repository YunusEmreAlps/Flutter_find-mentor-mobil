// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/app_localizations.dart';
import 'package:find_mentor/core/navigation/navigation_constants.dart';
import 'package:find_mentor/ui/view/home/home_navigator.dart';
import 'package:find_mentor/ui/view/splash/splash_page.dart';

// Find Mentor & Mentees Network
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
      title: AppStrings.APP_NAME,
      debugShowCheckedModeBanner: false,
      // Internationalization
      supportedLocales: [Locale("en"), Locale("tr")],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: NavigationConstants.SPLASH,
      routes: {
        NavigationConstants.SPLASH: (context) => SplashPage(),
        NavigationConstants.HOME: (context) => HomeNavigator(),
      },
    );
  }
}