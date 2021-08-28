import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:find_mentor/util/utility.dart';
import 'package:find_mentor/model/person.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/page/home/persons_detail_page/persons_detail_page_body.dart';

class PersonsDetailPage extends StatelessWidget {
  final Person personDetail;
  const PersonsDetailPage({Key key, @required this.personDetail})
      : super(key: key);

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
          mentorValues.reverse[personDetail.mentor] != 'Both'
              ? mentorValues.reverse[personDetail.mentor]
              : 'Mentor & Mentee',
          style: TextStyle(
              fontFamily: "Gilroy",
              foreground: Paint()
                ..shader = AppConstant.primaryTextGradientColor),
        ),
        brightness: Brightness.light,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[PersonsDetailPageBody(personDetail: personDetail)],
      ),
      floatingActionButton: (personDetail.isHireable)
          ? FloatingActionButton(
              tooltip: 'HIRE ME!',
              onPressed: () {
                Utility.launchURL(personDetail.mail);
              },
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
              backgroundColor: AppConstant.colorPrimary,
            )
          : Container(),
    );
  }
}
