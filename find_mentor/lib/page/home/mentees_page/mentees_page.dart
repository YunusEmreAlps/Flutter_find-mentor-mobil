import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/page/home/mentees_page/mentees_detail_page.dart';

class MenteesPage extends StatefulWidget {
  @override
  _MenteesPageState createState() => _MenteesPageState();
}

class _MenteesPageState extends State<MenteesPage> {
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
          AppConstant.menteesText +
              ((AppConstant.menteesCount != 0)
                  ? " (${AppConstant.menteesCount})"
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
          MenteesDetailPage(),
        ],
      ),
    );
  }
}
