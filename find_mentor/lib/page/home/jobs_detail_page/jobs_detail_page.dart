import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_mentor/model/job_model.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/page/home/home_navigator.dart';
import 'package:find_mentor/page/home/jobs_detail_page/jobs_detail_page_body.dart';

class JobsDetailPage extends StatelessWidget{
  final Job jobDetail;
  const JobsDetailPage({Key key, @required this.jobDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.colorHeading,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.colorPageBg,
        title: Text(
          jobDetail.company,
          style: TextStyle(
              fontFamily: "Gilroy",
              foreground: Paint()
                ..shader = AppConstant.primaryTextGradientColor),
        ),
        brightness: Brightness.light,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          JobsDetailPageBody(jobDetail: jobDetail)
        ],
      ),
    );
  }
}

