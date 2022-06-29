// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/ui/view/home/jobs_page/jobs_page_body.dart';
import 'package:flutter/services.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
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
        JobsPageBody(),
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
        AppStrings.JOBS +
            ((AppConstants.jobsCount != 0)
                ? " (${AppConstants.jobsCount})"
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
