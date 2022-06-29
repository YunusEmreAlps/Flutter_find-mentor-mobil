// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/ui/view/home/mentors_page/mentors_page_body.dart';
import 'package:flutter/services.dart';

class MentorsPage extends StatefulWidget {
  @override
  _MentorsPageState createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
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
        MentorsPageBody(),
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
        AppStrings.MENTORS +
            ((AppConstants.mentorsCount != 0)
                ? " (${AppConstants.mentorsCount})"
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
