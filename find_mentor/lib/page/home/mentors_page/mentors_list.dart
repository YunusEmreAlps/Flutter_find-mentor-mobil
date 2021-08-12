import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:find_mentor/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_mentor/model/person.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Mentors extends StatelessWidget {
  const Mentors({
    Key key,
    this.mentors,
  }) : super(key: key);
  // Because our Api provide us list of mentors
  final List<Person> mentors;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(20), //20
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: mentors.length,
        itemBuilder: (context, index) => MentorCard(
          mentor: mentors[index],
          press: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  person: mentors[index],
                ),
              ),
            );*/
          },
        ),
      ),
    );
  }
}

// Mentor Card
class MentorCard extends StatelessWidget {
  const MentorCard({
    Key key,
    this.mentor,
    this.press,
  }) : super(key: key);

  final Person mentor;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: press,
        child: mentorItem(),
      ),
    );
  }

  Widget mentorItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (mentor.displayInterests.length <= 75) ? 285.0 : 310.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppConstant.colorPageBg, // Color(0xFF216383) strong
                      AppConstant.colorPageBg, // Color(0xFF71BFBC) light
                    ]),
                borderRadius: BorderRadius.circular(15.0),
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
                  // Find Mentor Logo -> 24, 24
                  Positioned(
                    top: -96, // 24
                    right: -96, // 24
                    child: Container(
                      height: 192,
                      width: 192,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConstant.colorPrimary.withOpacity(0.3),
                            width: 10,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: -96, // 24
                    left: -96, // 24
                    child: Container(
                      height: 192,
                      width: 192,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConstant.colorPrimary.withOpacity(0.3),
                            width: 10,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 15,
                    left: 15,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Container(
                                        padding: EdgeInsets.all(30 / 192 * 10),
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: RadialGradient(
                                            colors: [
                                              (mentor.mentor != Mentor.BOTH)
                                                  ? AppConstant.colorMentor
                                                      .withOpacity(0.3)
                                                  : AppConstant.colorBoth
                                                      .withOpacity(0.3),
                                              (mentor.mentor != Mentor.BOTH)
                                                  ? AppConstant.colorMentor
                                                      .withOpacity(0.6)
                                                  : AppConstant.colorBoth
                                                      .withOpacity(0.6),
                                            ],
                                            stops: [.5, 1],
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          child: CachedNetworkImage(
                                            imageUrl: mentor.avatar,
                                            fit: BoxFit.contain,
                                            errorWidget:
                                                (context, url, error) =>  Image.asset(AppConstant.pngUserImage),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 13, 0, 13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 175,
                                            child: Text(
                                              mentor.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Gilroy",
                                                color: AppConstant.colorMentor,
                                              ),
                                            ),
                                          ),

                                          /*Text(
                                            mentor.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy",
                                              color: AppConstant.colorMentor,
                                            ),
                                          ),*/
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 175,
                                            child: Text(
                                              mentor.displayInterests,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                // color: Color(0xFFB5BFD0),
                                                color: Color(0xFF898989),
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
                        SizedBox(height: 20),
                        Container(
                          width: SizeConfig.screenWidth * 0.8,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: AppConstant.colorLightGreen,
                                  height: 1.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  AppConstant.getConnectedText,
                                  style: TextStyle(
                                    color: AppConstant.colorLightGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppConstant.colorLightGreen,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 80,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Twitter
                                    InkWell(
                                      onTap: () {
                                        _launchURL(mentor.twitterHandle);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.defaultSize,
                                        ), // 10
                                        padding: EdgeInsets.all(
                                          SizeConfig.defaultSize * 0.1,
                                        ), // 1
                                        height:
                                            SizeConfig.defaultSize * 4, // 40
                                        width: SizeConfig.defaultSize * 4, // 40
                                        decoration: BoxDecoration(
                                          color: AppConstant
                                              .colorPrimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          AppConstant.svgMentorTwitter,
                                        ),
                                      ),
                                    ),
                                    // GitHub
                                    InkWell(
                                      onTap: () {
                                        _launchURL(mentor.github);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.defaultSize,
                                        ), // 10
                                        padding: EdgeInsets.all(
                                          SizeConfig.defaultSize * 0.1,
                                        ), // 6
                                        height:
                                            SizeConfig.defaultSize * 4, // 40
                                        width: SizeConfig.defaultSize * 4, // 40
                                        decoration: BoxDecoration(
                                          color: AppConstant
                                              .colorPrimary, 
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          AppConstant.svgMentorGitHub,
                                        ),
                                      ),
                                    ),
                                    // LinkedIn
                                    InkWell(
                                      onTap: () {
                                        _launchURL(mentor.linkedin);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.defaultSize,
                                        ), // 10
                                        padding: EdgeInsets.all(
                                          SizeConfig.defaultSize * 0.1,
                                        ), // 6
                                        height:
                                            SizeConfig.defaultSize * 4, // 40
                                        width: SizeConfig.defaultSize * 4, // 40
                                        decoration: BoxDecoration(
                                          color: AppConstant
                                              .colorPrimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          AppConstant.svgMentorLinkedin,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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