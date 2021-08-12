// Splash Screen
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/util/app_localizations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/*
  Find & Match With Your Mentor/Mentee 
  Meet -> Ask -> Listen -> Learn
  Change Your Career
*/

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, AppConstant.pageHome);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(AppConstant.pngBackgroundImage),
              fit: BoxFit.cover),
        ),
        

        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Logo
            Center(
              child: SvgPicture.asset(
                AppConstant.svgLogo,
                height: 160,
              ),
            ),

            // Animated Text
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RotateAnimatedTextKit(
                      alignment: Alignment.center,
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        AppConstant.splashAnimatedText1,
                        AppConstant.splashAnimatedText2,
                        AppConstant.splashAnimatedText3
                      ],
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Gilroy",
                          foreground: Paint()
                            ..shader = AppConstant.primaryTextGradientColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
