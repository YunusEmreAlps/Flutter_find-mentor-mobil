import 'package:find_mentor/util/utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
            AppWidget.pullDown(AppConstant.colorPullDown1),
            widget,
            //
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  AppConstant.appName,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: "Gilroy",
                      foreground: Paint()
                        ..shader = AppConstant.primaryTextGradientColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 32, 40, 0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppConstant.colorAppDescription),
                    children: <TextSpan>[
                      TextSpan(
                          text: AppConstant.appLongRichDescription,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: AppConstant.appLongDescription),
                    ],
                  ),
                ),
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
          AppWidget.pullDown(AppConstant.colorPullDown1),
          widget,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(AppConstant.svgMessage3, height: 80),
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
                            text: AppConstant.contributionsText,
                            style: new TextStyle(
                                color: AppConstant.colorPrimary,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                launch(AppConstant.githubLink);
                              },
                          ),
                          new TextSpan(text: ' '),
                          new TextSpan(
                            text: AppConstant.suggestionsDetails,
                            style: TextStyle(
                              fontFamily: "Gilroy",
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
            AppWidget.pullDown(AppConstant.colorPullDown1),
            widget,
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: AppBottomSheetWidgets.sectionItem(AppConstant.joinUsText),
            ),
            // Google Form
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(AppConstant.joinUsNowText,
                  AppConstant.googleFormLink, AppConstant.svgJoin),
            ),
            // Discord
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'Discord', AppConstant.discordLink, AppConstant.svgDiscord),
            ),
            // GitHub
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'GitHub', AppConstant.githubLink, AppConstant.svgGitHub),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 22),
              child: Divider(
                  color: AppConstant.colorBottomSheetDivider, thickness: 1),
            ),
            AppBottomSheetWidgets.sectionItem(AppConstant.followUsText),
            // Twitter
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'Twitter', AppConstant.twitterLink, AppConstant.svgTwitter),
            ),
            // Youtube
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow(
                  'YouTube', AppConstant.youtubeLink, AppConstant.svgYoutube),
            ),
            // LinkedIn
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: AppBottomSheetWidgets.socialRow('LinkedIn',
                  AppConstant.linkedinLink, AppConstant.svgLinkedin),
            ),
            // Website Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 6, 0, 0),
              child: MaterialButton(
                minWidth: 314,
                height: 48,
                elevation: 0,
                color: AppConstant.colorDrawerButton,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8)),
                child: Text(
                  AppConstant.websiteBtnText,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = AppConstant.primaryTextGradientColor
                      // color: AppConstant.colorHeading,
                      ),
                ),
                onPressed: () {
                  _launchURL(AppConstant.websiteLink);
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
                    color: AppConstant.colorBottomSheetItemHeader,
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
        color: AppConstant.colorDrawerButton,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
        child: Text(
          AppConstant.sendText,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppConstant.colorHeading),
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
                fontFamily: "Gilroy",
              ),
            ),
          ),
        ],
      );

  static Widget phoneRow(IconData icon) => Row(
        children: <Widget>[
          Icon(icon, size: 15, color: AppConstant.colorPrimary),
          FlatButton(
              onPressed: _callPhone, child: Text(AppConstant.phoneNumber)),
        ],
      );

  // Mail
  static _sendMail() async {
    final String mail = 'mailto:' + AppConstant.eposta;
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw AppConstant.mailErrorText;
    }
  }

  // Call
  static _callPhone() async {
    final String phone = 'tel:' + AppConstant.phoneNumber;
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw AppConstant.callErrorText;
    }
  }

  // URL
  static _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw AppConstant.websiteErrorText;
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
        color: AppConstant.colorParagraph2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}
