// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/size_config.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/event.dart';
import 'package:find_mentor/ui/components/event_badge.dart';

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
              decoration: boxDecoration(),
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
                    child: circleContainer(),
                  ),
                  Positioned(
                    bottom: -96, // 24
                    left: -96, // 24
                    child: circleContainer(),
                  ),
                  Positioned(
                    top: 35,
                    right: 15,
                    left: 15,
                    child: Column(
                      children: [
                        eventContainer(),
                        SizedBox(height: 20),
                        infoContainer(),
                        SizedBox(height: 10),
                        speakerContainer(),
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
                          '',
                          style: TextStyle(
                              fontFamily: AppStrings.FONT_FAMILY,
                              color: AppColors.colorGrey),
                        ),
                        Text(
                          '${event.date}',
                          style: TextStyle(
                              fontFamily: AppStrings.FONT_FAMILY,
                              color: AppColors.colorGrey),
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

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.colorPageBg, // Color(0xFF216383) strong
            AppColors.colorPageBg, // Color(0xFF71BFBC) light
          ]),
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 20,
          color: Color(0xFFB0CCE1).withOpacity(0.32),
        ),
      ],
    );
  }

  Container eventContainer() {
    return Container(
      width: double.infinity,
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Events Link
                      InkWell(
                        onTap: () {
                          Utility.launchURL(event.link);
                        },
                        child: Container(
                          width: 260,
                          child: Text(
                            event.eventName,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppStrings.FONT_FAMILY,
                              color: AppColors.colortextDark,
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
    );
  }

  Container infoContainer() {
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: AppColors.colorLightGreen,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              AppStrings.SPEAKERS,
              style: TextStyle(
                color: AppColors.colorLightGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.colorLightGreen,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Container speakerContainer() {
    return Container(
      width: double.infinity,
      height: 80,
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 30,
                child: speakerlistView(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView speakerlistView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (event.speakers.length > 0) {
          return InkWell(
            onTap: () {
              Utility.launchURL(event.speakers[index].twitter);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 10.0,
                right: index == event.speakers.length - 1 ? 10 : 0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFB5BFD0)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                event.speakers[index].name[0].toUpperCase() +
                    event.speakers[index].name.substring(1),
                style: TextStyle(
                  color: Color(0xFF12153D).withOpacity(0.8),
                  fontFamily: AppStrings.FONT_FAMILY,
                ),
              ),
            ),
          );
        }
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 0,
      ),
      itemCount: event.speakers.length,
    );
  }

  Container circleContainer() {
    return Container(
      height: 192,
      width: 192,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.colorPrimary.withOpacity(0.3),
          width: 10,
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
        eventColor = AppColors.colorLightGreen.withOpacity(0.6);
        eventText = 'Done';
        break;
      case 'cancelled':
        eventColor = AppColors.colorRed.withOpacity(0.6);
        eventText = 'Cancelled';
        break;
      case 'postponed':
        eventColor = AppColors.colorLightOrange.withOpacity(0.6);
        eventText = 'Postponed';
        break;
      case 'rescheduled':
        eventColor = AppColors.colorLightOrange.withOpacity(0.6);
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
