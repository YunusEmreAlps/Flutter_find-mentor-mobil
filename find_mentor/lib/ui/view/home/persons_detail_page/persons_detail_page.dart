// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';
import 'package:find_mentor/ui/view/home/persons_detail_page/persons_detail_page_body.dart';
import 'package:flutter/services.dart';

class PersonsDetailPage extends StatelessWidget {
  final Person personDetail;
  const PersonsDetailPage({
    Key key,
    @required this.personDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildStack(),
      floatingActionButton: ((personDetail.isHireable)
          ? buildFloatingActionButton()
          : Container()),
    );
  }

  // Job Seeker!
  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      tooltip: 'HIRE ME!',
      onPressed: () {
        Utility.launchURL("mailto:" + personDetail.mail);
      },
      child: Icon(
        Icons.message,
        color: Colors.white,
      ),
      backgroundColor: AppColors.colorPrimary,
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[PersonsDetailPageBody(personDetail: personDetail)],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: buildIconButton(context),
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.colorPageBg,
      title: Text(
        (mentorValues.reverse[personDetail.mentor] != 'Both')
            ? mentorValues.reverse[personDetail.mentor]
            : AppStrings.MENTOR + ' & ' + AppStrings.MENTEE,
        style: TextStyle(
          fontFamily: AppStrings.FONT_FAMILY,
          foreground: Paint()..shader = AppGradients.primaryTextGradientColor,
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.colorHeading,
      ),
    );
  }
}
