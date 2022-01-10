// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/model/job_model.dart';
import 'package:find_mentor/ui/view/home/home_navigator.dart';
import 'package:find_mentor/ui/view/home/jobs_detail_page/jobs_detail_page_body.dart';

class JobsDetailPage extends StatelessWidget{
  final Job jobDetail;
  const JobsDetailPage({Key key, @required this.jobDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildStack(),
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        JobsDetailPageBody(jobDetail: jobDetail)
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: buildIconButton(context),
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.colorPageBg,
      title: Text(
        jobDetail.company,
        style: TextStyle(
            fontFamily: AppStrings.FONT_FAMILY,
            foreground: Paint()
              ..shader = AppGradients.primaryTextGradientColor),
      ),
      brightness: Brightness.light,
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.colorHeading,
      ),
    );
  }
}

