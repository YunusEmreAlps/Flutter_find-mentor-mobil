import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:find_mentor/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_mentor/model/job_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Jobs extends StatelessWidget {
  const Jobs({
    Key key,
    this.jobs,
  }) : super(key: key);
  // Because our Api provide us list of jobs
  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(20), //20
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: jobs.length,
        itemBuilder: (context, index) => JobCard(
          job: jobs[index],
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

// Job Card
class JobCard extends StatelessWidget {
  const JobCard({
    Key key,
    this.job,
    this.press,
  }) : super(key: key);

  final Job job;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: press,
        child: jobItem(),
      ),
    );
  }

  Widget jobItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (job.company.length <= 75) ? 285.0 : 310.0,
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
                                              AppConstant.colorGreyLight
                                                  .withOpacity(0.3),
                                              AppConstant.colorGreyLight
                                                  .withOpacity(0.6)
                                            ],
                                            stops: [.5, 1],
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          child: CachedNetworkImage(
                                            imageUrl: job.logo,
                                            fit: BoxFit.contain,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(AppConstant
                                                        .pngCompanyImage),
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
                                              job.company,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Gilroy",
                                                color:
                                                    AppConstant.colortextDark,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 175,
                                            child: Text(
                                              job.position,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                // color: Color(0xFFB5BFD0),
                                                color: Color(0xFF898989),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
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
                                  AppConstant.requirementsText,
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
                                filter: ui.ImageFilter.blur(
                                    sigmaX: 8.0, sigmaY: 8.0),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.0),
                                    child: SizedBox(
                                      height: 30,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            if (job.tags[index].length > 0) {
                                              return Container(
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(
                                                      left: 10.0,
                                                       right: index == job.tags.length - 1 ? 10 : 0,),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xFFB5BFD0)),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  job.tags[index][0].toUpperCase() + job.tags[index].substring(1),
                                                  style: TextStyle(
                                                      color: Color(0xFF12153D)
                                                          .withOpacity(0.8),
                                                      fontFamily: 'Gilroy',),
                                                ),
                                              );
                                            }
                                          },
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                height: 0,
                                              ),
                                          itemCount: job.tags.length),

                                      /*Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                  ],
                                ),*/
                                    ),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remote: ${remoteValues.reverse[job.remote]}",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              color: AppConstant.colorGrey),
                        ),
                        Text(
                          '${job.date.substring(0, 10)}',
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              color: AppConstant.colorGrey),
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

  Widget _makeElement(String tag) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Text(
          tag,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  _getChildList(List<String> tagList) {
    List<Widget> widgetList = [];
    tagList.forEach((listElement) {
      widgetList.add(_makeElement(listElement));
    });
    return widgetList;
  }
}

// Null Avatar
Color randomColor() {
  var random = Random();
  final colorList = [
    AppConstant.colorPrimary,
    AppConstant.colorOrange,
    AppConstant.colorGreen,
    AppConstant.colorGrey,
    AppConstant.colorLightOrange,
    AppConstant.colorSkyBlue,
    AppConstant.colorPurpleExtraLight,
  ];
  var color = colorList[random.nextInt(colorList.length)];
  return color;
}
