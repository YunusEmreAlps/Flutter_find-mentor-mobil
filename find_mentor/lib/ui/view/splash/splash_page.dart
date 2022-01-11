// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/app_localizations.dart';
import 'package:find_mentor/core/navigation/navigation_constants.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    Future.delayed(Duration(seconds: AppConstants.duration), () {
      Navigator.pushReplacementNamed(context, NavigationConstants.HOME);
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
      body: buildDecoratedBox(),
    );
  }

  DecoratedBox buildDecoratedBox() {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(AppImages.pngBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: buildStack(),
    );
  }

  Stack buildStack() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        iconWidget(),
        loadingWidget(),
        animatedColumn(),
      ],
    );
  }

  // Loading...
  Widget loadingWidget() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        height: 200,
        child: CircularProgressIndicator(
          strokeWidth: 10,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  // Find Mentor Logo
  Widget iconWidget() {
    return Center(
      child: SvgPicture.asset(
        AppImages.svgLogo,
        height: 160,
      ),
    );
  }

  Widget animatedColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            animatedText(),
          ],
        ),
      ],
    );
  }

  // Animated Text  
  Widget animatedText() {
    return RotateAnimatedTextKit(
      alignment: Alignment.center,
      onTap: () {
        print("Tap Event");
      },
      text: [
        AppStrings.SPLASH_TEXT1,
        AppStrings.SPLASH_TEXT2,
        AppStrings.SPLASH_TEXT3,
      ],
      textStyle: TextStyle(
        fontSize: 18.0,
        fontFamily: AppStrings.FONT_FAMILY,
        foreground: Paint()..shader = AppGradients.primaryTextGradientColor,
      ),
    );
  }
}
