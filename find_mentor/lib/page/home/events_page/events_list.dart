import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:find_mentor/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_mentor/model/event.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/widget/event_badge.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Events extends StatelessWidget {
  const Events({
    Key key,
    this.events,
  }) : super(key: key);
  // Because our Api provide us list of events
  final List<EventElement> events;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(20), //20
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: events.length,
        itemBuilder: (context, index) => EventCard(
          event: events[index],
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

// Event Card
class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    this.event,
    this.press,
  }) : super(key: key);

  final EventElement event;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: press,
        child: eventItem(),
      ),
    );
  }

  Widget eventItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (event.eventName.length <= 75) ? 285.0 : 310.0,
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
                  Positioned(
                    top: 0, // 24
                    left: 0, // 24
                    child: Container(
                      child: buildStatusBadge(event.status),
                    ),
                  ),
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
                    top: 35,
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
                                          EdgeInsets.fromLTRB(10, 15, 10, 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Events Link
                                          InkWell(
                                            onTap: () {
                                              _launchURL(event.link);
                                            },
                                            child: Container(
                                              width: 260,
                                              child: Text(
                                                event.eventName,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Gilroy",
                                                  color:
                                                      AppConstant.colortextDark,
                                                ),
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
                                  AppConstant.speakersText,
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: SizedBox(
                                    height: 30,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          if (event.speakers.length > 0) {
                                            return InkWell(
                                              onTap: () {
                                                _launchURL(event
                                                    .speakers[index].twitter);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                  left: 10.0,
                                                  right: index ==
                                                          event.speakers
                                                                  .length -
                                                              1
                                                      ? 10
                                                      : 0,
                                                ),
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
                                                  event.speakers[index].name[0]
                                                          .toUpperCase() +
                                                      event.speakers[index].name
                                                          .substring(1),
                                                  style: TextStyle(
                                                    color: Color(0xFF12153D)
                                                        .withOpacity(0.8),
                                                    fontFamily: 'Gilroy',
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 0,
                                            ),
                                        itemCount: event.speakers.length),

                                    /*Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                  ],
                                ),*/
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                          "",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              color: AppConstant.colorGrey),
                        ),
                        Text(
                          '${event.date}',
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

  // Speakers
  Widget buildSpeakersItem(int index) {
    return GestureDetector(
      onTap: () {
        _launchURL(event.speakers[index].twitter);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2, //20
          vertical: SizeConfig.defaultSize * 0.5, //5
        ),
        child: Text(
          event.speakers[index].name,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            // color: Color(0xFFB5BFD0),
            color: Color(0xFF898989),
          ),
        ),
      ),
    );
  }

  // Event Status
  Widget buildStatusBadge(String eventStatus) {
    Color eventColor;
    String eventText;

    switch (eventStatus) {
      case 'done':
        eventColor = AppConstant.colorLightGreen.withOpacity(0.6);
        eventText = 'Done';
        break;
      case 'cancelled':
        eventColor = AppConstant.colorRed.withOpacity(0.6);
        eventText = 'Cancelled';
        break;
      case 'postponed':
        eventColor = AppConstant.colorLightOrange.withOpacity(0.6);
        eventText = 'Postponed';
        break;
      case 'rescheduled':
        eventColor = AppConstant.colorLightOrange.withOpacity(0.6);
        eventText = 'Rescheduled';
        break;
    }

    return Align(
      alignment: Alignment.centerRight,
      child: CustomPaint(
          painter: EventBadge(color: eventColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: Text(
              eventText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
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
