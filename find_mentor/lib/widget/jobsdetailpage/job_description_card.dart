import 'package:flutter/material.dart';
import 'package:find_mentor/util/utility.dart';
import 'package:find_mentor/model/job_model.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class JobDescriptionCard extends StatelessWidget {
  const JobDescriptionCard({Key key, this.model, this.onApplyTap})
      : super(key: key);
  final Job model;
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
                // Job Created Time
                Text(
                  Utility.jobTimeCreatedAt('${model.date.substring(0, 10)}'),
                  style: TextStyle(
                      fontFamily: "Gilroy", color: AppConstant.colorGrey),
                ),
                // Style or Location
                Text(
                  (remoteValues.reverse[model.remote] == 'Evet')
                      ? 'Remote'
                      : model.location,
                  style: TextStyle(
                      fontFamily: "Gilroy", color: AppConstant.colorGrey),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          MarkdownBody(
            data: model.description,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 14.0, fontFamily: "Gilroy", color: AppConstant.jobTextLink),
            ),
            onTapLink: (url){
              Utility.launchURL(url);
            },
          ),
        ],
      ),
    );
  }
}
