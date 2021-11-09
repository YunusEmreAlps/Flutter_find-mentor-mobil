// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/app_widget.dart';
import 'package:find_mentor/core/init/size_config.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/service/fetchJobs.dart';
import 'package:find_mentor/ui/view/home/jobs_page/jobs_list.dart';

class JobsPageBody extends StatefulWidget {
  @override
  _JobsPageBodyState createState() => _JobsPageBodyState();
}

class _JobsPageBodyState extends State<JobsPageBody> {
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
                          AppStrings.SEARCH_JOB),
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
                                    AppColors
                                        .colorPageBg, // Color(0xFF216383) strong
                                    AppColors
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
                                                            AppStrings.JOBSPAGE_GUIDE,
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
                                                            Utility.launchURL(AppStrings.ADD_JOB_URL);
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
                                                                color: AppColors
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
                                                AppColors.colorPrimary),
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
}
