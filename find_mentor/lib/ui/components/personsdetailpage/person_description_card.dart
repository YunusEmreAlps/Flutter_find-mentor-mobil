// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_markdown/flutter_markdown.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';

class PersonDescriptionCard extends StatelessWidget {
  const PersonDescriptionCard({Key key, this.model, this.onApplyTap})
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
                  '${AppStrings.INTERESTS}',
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 16,
                      color: AppColors.colorGreen),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          MarkdownBody(
            data: model.interests,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: 14.0,
                  fontFamily: "Gilroy",
                  color: AppColors.jobTextLink),
            ),
            onTapLink: (url) {
              Utility.launchURL(url);
            },
          ),
          SizedBox(height: 12),
          Divider(
            color: AppColors.colorLightGreen,
            height: 1.5,
          ),
          SizedBox(height: 12),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppStrings.GOALS}',
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 16,
                      color: AppColors.colorGreen),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          MarkdownBody(
            data: model.goals,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: 14.0,
                  fontFamily: "Gilroy",
                  color: AppColors.jobTextLink),
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
