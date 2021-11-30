// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_markdown/flutter_markdown.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';
import 'package:find_mentor/core/service/fetchReadMe.dart';

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
              AppColors.colorPageBg, // Color(0xFF216383) strong
              AppColors.colorPageBg, // Color(0xFF71BFBC) light
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GitHub',
                  style: TextStyle(
                      fontFamily: AppStrings.FONT_FAMILY,
                      fontSize: 16,
                      color: AppColors.colorGrey),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          FutureBuilder(
            future: fetchReadMe(model.github.substring(19), model.github.substring(19), "master", "README"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MarkdownBody(
                  selectable: true,
                  shrinkWrap: true,
                  fitContent: true,
                  data: snapshot.data,
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
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
    );
  }
}
