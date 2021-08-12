import 'dart:ui' as ui;
import 'package:find_mentor/widget/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchJobs.dart';
import 'package:find_mentor/page/home/jobs_page/jobs_list.dart';
import 'package:url_launcher/url_launcher.dart';

class JobsDetailPage extends StatefulWidget {
  @override
  _JobsDetailPageState createState() => _JobsDetailPageState();
}

class _JobsDetailPageState extends State<JobsDetailPage> {
  bool isKeyboardVisible;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    isKeyboardVisible = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: Colors.black38,
                      elevation: 4,
                      child: AppWidget.getSearchBox(isKeyboardVisible, context,
                          AppConstant.searchJobText),
                    ),
                  ),
                  // Description
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 165.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppConstant
                                        .colorPageBg, // Color(0xFF216383) strong
                                    AppConstant
                                        .colorPageBg, // Color(0xFF71BFBC) light
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 20,
                                  color: Color(0xFFB0CCE1).withOpacity(0.32),
                                ),
                              ],
                            ),
                            child: Stack(
                              overflow: Overflow.clip,
                              children: [
                                Positioned(
                                  top: 15,
                                  right: 15,
                                  left: 15,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: ClipRect(
                                          child: BackdropFilter(
                                            filter: ui.ImageFilter.blur(
                                                sigmaX: 8.0, sigmaY: 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 15, 10, 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 260,
                                                          child: Text(
                                                            "This community, driven/developed by a fellow community. As you can see, this project is the mentorship project. Developed by mentees.\nYou can list your job listing below for 30 days.",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Gilroy",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12,
                                                              color: Color(0xff7B7F9E),
                                                              height: 1.5,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            _launchURL(
                                                                AppConstant
                                                                    .addJobLink);
                                                          },
                                                          child: Container(
                                                            width: 260,
                                                            child: Text(
                                                              "Add your job listing",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Gilroy",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13,
                                                                // color: Color(0xFFB5BFD0),
                                                                color: AppConstant
                                                                    .colorLink,
                                                                height: 1.5,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: fetchJobs(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Jobs(jobs: snapshot.data)
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CircularProgressIndicator(
                                            strokeWidth: 3,
                                            valueColor: AlwaysStoppedAnimation(
                                                AppConstant.colorPrimary),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // URL
  static _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw AppConstant.websiteErrorText;
    }
  }
}
