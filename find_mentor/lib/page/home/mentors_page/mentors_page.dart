import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/page/home/mentors_page/mentors_page_body.dart';

class MentorsPage extends StatefulWidget {
  @override
  _MentorsPageState createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
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
          AppConstant.mentorsText +
              ((AppConstant.mentorsCount != 0)
                  ? " (${AppConstant.mentorsCount})"
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
          MentorsPageBody(),
        ],
      ),
    );
  }
}
