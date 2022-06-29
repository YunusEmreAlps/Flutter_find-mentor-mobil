// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/ui/view/home/mentees_page/mentees_page_body.dart';
import 'package:flutter/services.dart';

class MenteesPage extends StatefulWidget {
  @override
  _MenteesPageState createState() => _MenteesPageState();
}

class _MenteesPageState extends State<MenteesPage> {
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
        MenteesPageBody(),
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
        AppStrings.MENTEES +
            ((AppConstants.menteesCount != 0)
                ? " (${AppConstants.menteesCount})"
                : ""),
        style: TextStyle(
          fontFamily: AppStrings.FONT_FAMILY,
          foreground: Paint()..shader = AppGradients.primaryTextGradientColor,
        ),
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
