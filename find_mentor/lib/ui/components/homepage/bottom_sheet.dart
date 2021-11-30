// Flutter imports:
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/service/fetchReadMe.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/app_widget.dart';

class AppBottomSheetWidgets {
  static Widget selectCategory(Widget widget, Widget widget2) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[widget, widget2],
        ),
      );

  // How It Works?
  static Widget buildHowItWorksItem(Widget widget) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppWidget.pullDown(AppColors.colorPullDown1),
            widget,
            //
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  AppStrings.APP_NAME,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: AppStrings.FONT_FAMILY,
                      foreground: Paint()
                        ..shader = AppGradients.primaryTextGradientColor),
                ),
              ),
            ),
            // How To Be A 🌟GREAT🌟 Mentee?
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.colorPageBg, // Color(0xFF216383) strong
                      AppColors.colorPageBg // Color(0xFF71BFBC) light
                    ]),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  FutureBuilder(
                    future: fetchReadMe(
                      "findmentor-network",
                      "find-mentor",
                      "master",
                      "content/mentees",
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MarkdownBody(
                          selectable: true,
                          shrinkWrap: true,
                          fitContent: true,
                          data: snapshot.data,
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(Theme.of(context))
                                  .copyWith(
                            p: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0,
                                fontFamily: AppStrings.FONT_FAMILY,
                                color: AppColors.jobTextLink),
                          ),
                          onTapLink: (url) {
                            Utility.launchURL(url);
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            // How To Be A 🌟ROCKSTAR🌟 Mentor?
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.colorPageBg, // Color(0xFF216383) strong
                      AppColors.colorPageBg // Color(0xFF71BFBC) light
                    ]),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  FutureBuilder(
                    future: fetchReadMe(
                      "findmentor-network",
                      "find-mentor",
                      "master",
                      "content/mentors",
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MarkdownBody(
                          selectable: true,
                          shrinkWrap: true,
                          fitContent: true,
                          data: snapshot.data,
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(Theme.of(context))
                                  .copyWith(
                            p: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0,
                                fontFamily: AppStrings.FONT_FAMILY,
                                color: AppColors.jobTextLink),
                          ),
                          onTapLink: (url) {
                            Utility.launchURL(url);
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // Contributions & Suggestions
  static Widget buildKatkiItem(Widget widget) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppWidget.pullDown(AppColors.colorPullDown1),
          widget,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(AppImages.iconMessage3, height: 80),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 30, 32, 24),
                  // Feel Free to Contribute!
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: _bottomSheetTextStyleF14W500,
                        children: <TextSpan>[
                          new TextSpan(
                            text: AppStrings.FEEDBACK_LINK_TEXT,
                            style: new TextStyle(
                                color: AppColors.colorPrimary,
                                fontFamily: AppStrings.FONT_FAMILY,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                launch(AppStrings.GITHUB_LINK);
                              },
                          ),
                          new TextSpan(text: ' '),
                          new TextSpan(
                            text: AppStrings.SUGGESTIONS_DETAILS,
                            style: TextStyle(
                              fontFamily: AppStrings.FONT_FAMILY,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AppBottomSheetWidgets.btnEpostaYaz,
              ],
            ),
          )
        ],
      );

  static Widget buildIletisimItem(Widget widget) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppWidget.pullDown(AppColors.colorPullDown1),
            widget,
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: AppBottomSheetWidgets.sectionItem(AppStrings.JOIN_US),
            ),
            // Google Form
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(AppStrings.JOIN_US_NOW,
                  AppStrings.JOIN_LINK, AppImages.iconJoin),
            ),
            // Discord
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'Discord', AppStrings.DISCORD_LINK, AppImages.iconDiscord),
            ),
            // GitHub
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'GitHub', AppStrings.GITHUB_LINK, AppImages.iconGitHub),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 22),
              child: Divider(
                  color: AppColors.colorBottomSheetDivider, thickness: 1),
            ),
            AppBottomSheetWidgets.sectionItem(AppStrings.FOLLOW_US),
            // Twitter
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'Twitter', AppStrings.TWITTER_LINK, AppImages.iconTwitter),
            ),
            // Youtube
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'YouTube', AppStrings.YOUTUBE_LINK, AppImages.iconYoutube),
            ),
            // LinkedIn
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'LinkedIn', AppStrings.LINKEDIN_LINK, AppImages.iconLinkedin),
            ),
            // Website Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 6, 0, 0),
              child: MaterialButton(
                minWidth: 314,
                height: 48,
                elevation: 0,
                color: AppColors.colorDrawerButton,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8)),
                child: Text(
                  AppStrings.FIND_MENTOR_NETWORK,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = AppGradients.primaryTextGradientColor
                      // color: AppConstant.colorHeading,
                      ),
                ),
                onPressed: () {
                  _launchURL(AppStrings.WEB_LINK);
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );

  static Widget sectionItem(String header) => Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(header,
                style: TextStyle(
                    color: AppColors.colorBottomSheetItemHeader,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Padding(padding: const EdgeInsets.only(top: 10.0, bottom: 10.0)),
          ],
        ),
      );

  static Widget get btnEpostaYaz => MaterialButton(
        minWidth: 152,
        height: 48,
        elevation: 0,
        color: AppColors.colorDrawerButton,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
        child: Text(
          AppStrings.SEND,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.colorHeading),
        ),
        onPressed: _sendMail,
      );

  // Social Icons Row
  static Widget socialRow(String socialAppName, String url, String icon) => Row(
        children: <Widget>[
          SvgPicture.asset(
            icon,
            height: 20,
          ),
          FlatButton(
            onPressed: () {
              _launchURL(url);
            },
            child: Text(
              socialAppName,
              style: TextStyle(
                fontFamily: AppStrings.FONT_FAMILY,
              ),
            ),
          ),
        ],
      );

  static Widget phoneRow(IconData icon) => Row(
        children: <Widget>[
          Icon(icon, size: 15, color: AppColors.colorPrimary),
          FlatButton(
              onPressed: _callPhone, child: Text(AppStrings.PHONE_NUMBER)),
        ],
      );

  // Mail
  static _sendMail() async {
    final String mail = 'mailto:' + AppStrings.DEV_EMAIL;
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw AppStrings.MAIL_ERROR;
    }
  }

  // Call
  static _callPhone() async {
    final String phone = 'tel:' + AppStrings.PHONE_NUMBER;
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw AppStrings.CALL_ERROR;
    }
  }

  // URL
  static _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw AppStrings.WEB_ERROR;
    }
  }

  static BoxDecoration get bottomSheetBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15.0),
          topRight: const Radius.circular(15.0),
        ),
      );

  static TextStyle get _bottomSheetTextStyleF14W500 => TextStyle(
        color: AppColors.colorParagraph2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}
