// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:find_mentor/core/constants/color/app_gradients.dart';
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/screen_util.dart';

class FindMentorCover extends StatelessWidget {
  const FindMentorCover({
    Key key,
    @required bool isKeyboardVisible,
    @required this.context,
    this.scale,
  })  : _isKeyboardVisible = isKeyboardVisible,
        super(key: key);

  final bool _isKeyboardVisible;
  final BuildContext context;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isKeyboardVisible ? 0.0 : 1,
      duration: Duration(milliseconds: 280),
      child: Container(
        height: !_isKeyboardVisible ? ScreenUtil.getHeight(context) * scale : 0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(AppImages.pngBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            AppStrings.APP_NAME,
            style: TextStyle(
                fontSize: 36.0,
                fontFamily: "Gilroy",
                foreground: Paint()
                  ..shader = AppGradients.primaryTextGradientColor),
          ),
        ),
      ),
    );
  }
}
