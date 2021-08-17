import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/page/home/mentors_page/mentors_page_body.dart';

class MentorsPage extends StatefulWidget {
  @override
  _MentorsPageState createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
  PageController _pageController = PageController(initialPage: 3);
  bool isEmpty = false;
  int _selectedCategory = 0;

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
              ((AppConstant.mentorCount != 0)
                  ? " (${AppConstant.mentorCount})"
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
