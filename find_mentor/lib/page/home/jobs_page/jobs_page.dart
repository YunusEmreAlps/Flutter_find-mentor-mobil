import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchJobs.dart';
import 'package:find_mentor/page/home/jobs_page/jobs_detail_page.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.colorHeading,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.colorPageBg,
        title: Text(
          AppConstant.jobsText +
              ((AppConstant.jobsCount != 0)
                  ? " (${AppConstant.jobsCount})"
                  : ""),
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
          JobsDetailPage(),
        ],
      ),
    );
  }
}