// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/size_config.dart';
import 'package:find_mentor/core/model/job_model.dart';
import 'package:find_mentor/ui/view/home/jobs_detail_page/jobs_detail_page.dart';

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
      child: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // just for demo
      itemCount: jobs.length,
      itemBuilder: (context, index) => JobCard(
        job: jobs[index],
        press: () {
          buildPush(context, index);
        },
      ),
    );
  }

  Future buildPush(BuildContext context, int index) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobsDetailPage(
          jobDetail: jobs[index],
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
              decoration: boxDecoration(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
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
                    top: 25,
                    right: 15,
                    left: 15,
                    child: Column(
                      children: [
                        jobContainer(),
                        SizedBox(height: 20),
                        infoContainer(),
                        SizedBox(height: 10),
                        requirementContainer()
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
                              fontFamily: AppStrings.FONT_FAMILY,
                              color: AppColors.colorGrey),
                        ),
                        Text(
                          '${job.date.substring(0, 10)}',
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

  Container requirementContainer() {
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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (job.tags[index].length > 0) {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          left: 10.0,
                          right: index == job.tags.length - 1 ? 10 : 0,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFB5BFD0)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "${job.tags[index][0].toUpperCase() + job.tags[index].substring(1)}",
                          style: TextStyle(
                            color: Color(0xFF12153D).withOpacity(0.8),
                            fontFamily: AppStrings.FONT_FAMILY,
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 0,
                  ),
                  itemCount: job.tags.length,
                ),
              ),
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
              AppStrings.REQUIREMENTS,
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

  Container jobContainer() {
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
              children: [companyLogo(), jobInfo()],
            ),
          ),
        ),
      ),
    );
  }

  Padding companyLogo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        padding: EdgeInsets.all(30 / 192 * 10),
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              AppColors.colorGreyLight.withOpacity(0.3),
              AppColors.colorGreyLight.withOpacity(0.6)
            ],
            stops: [.5, 1],
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: CachedNetworkImage(
            imageUrl: job.logo,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => Image.asset(
              AppImages.pngCompanyImage,
            ),
          ),
        ),
      ),
    );
  }

  Padding jobInfo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 175,
            child: Text(
              job.company,
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppStrings.FONT_FAMILY,
                color: AppColors.colortextDark,
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
                fontFamily: AppStrings.FONT_FAMILY,
                fontSize: 12,
                color: Color(0xFF898989),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
