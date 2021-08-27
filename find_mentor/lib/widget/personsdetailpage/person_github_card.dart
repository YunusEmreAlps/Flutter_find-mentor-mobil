import 'package:flutter/material.dart';
import 'package:find_mentor/util/utility.dart';
import 'package:find_mentor/model/person.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PersonGitHubCard extends StatelessWidget {
  const PersonGitHubCard({Key key, this.model, this.onApplyTap})
      : super(key: key);
  final Person model;
  final Function onApplyTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppConstant.colorPageBg, // Color(0xFF216383) strong
              AppConstant.colorPageBg, // Color(0xFF71BFBC) light
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
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GitHub',
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 16,
                      color: AppConstant.colorGrey),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          MarkdownBody( // https://api.github.com/users/${username}
            data: "GitHub README",
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: 14.0,
                  fontFamily: "Gilroy",
                  color: AppConstant.jobTextLink),
            ),
            onTapLink: (url) {
              Utility.launchURL(url);
            },
          ),
        ],
      ),
    );
  }
}
