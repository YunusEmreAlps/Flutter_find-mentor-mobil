import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:find_mentor/util/utility.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchMentorships.dart';
import 'package:find_mentor/widget/homepage/mentorships_list.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Description
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 190.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            AppConstant.colorPageBg, // Color(0xFF216383) strong
                            AppConstant.colorPageBg, // Color(0xFF71BFBC) light
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
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 260,
                                                  child: Text(
                                                    AppConstant
                                                        .mentorshipsPageGuide,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: "Gilroy",
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    Utility.launchURL(AppConstant
                                                        .addMentorshipsLink);
                                                  },
                                                  child: Container(
                                                    width: 260,
                                                    child: Text(
                                                      "Add your mentorship campaign",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily: "Gilroy",
                                                        fontWeight:
                                                            FontWeight.w600,
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
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FutureBuilder(
                  future: fetchMentorships(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Mentorships(mentorships: snapshot.data)
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
