// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/ui/view/home/events_page/events_page_body.dart';
import 'package:flutter/services.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildStack(),
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        EventsPageBody(),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: buildIconButton(),
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.colorPageBg,
      title: Text(
        AppStrings.EVENTS +
            ((AppConstants.eventsCount != 0)
                ? " (${AppConstants.eventsCount})"
                : ""),
        style: TextStyle(
            fontFamily: AppStrings.FONT_FAMILY,
            foreground: Paint()
              ..shader = AppGradients.primaryTextGradientColor),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.colorHeading,
      ),
    );
  }
}
