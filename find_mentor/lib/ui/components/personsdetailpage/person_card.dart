// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/enums/enums.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({Key key, this.model}) : super(key: key);
  final Person model;
  Widget _companyInitial(ThemeData theme) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFE2E6EB),
                Color(0xFFE2E6EB),
              ]),
          borderRadius: BorderRadius.circular(
              50.0), // If you want to use text, BorderRadius must be 15.0
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xFFB0CCE1).withOpacity(0.32),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
            child: Container(
              padding: EdgeInsets.all(30 / 192 * 10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    randomColor().withOpacity(0.3),
                    randomColor().withOpacity(0.6),
                  ],
                  stops: [.5, 1],
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: CachedNetworkImage(
                  imageUrl: model.avatar,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.pngUser),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin:
                EdgeInsets.symmetric(vertical: 5) + EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.colorPageBg, // Color(0xFF216383) strong
                  AppColors.colorPageBg, // Color(0xFF71BFBC) light
                ],
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  color: Color(0xFFB0CCE1).withOpacity(0.32),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 60),
                    Center(
                      child: Text(
                        model.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: AppStrings.FONT_FAMILY,
                            fontSize: 18,
                            color: AppColors.colorHeading),
                      ),
                    ),
                    Center(
                      child: Text(
                        "@${model.slug}",
                        style: TextStyle(
                            fontFamily: AppStrings.FONT_FAMILY,
                            fontSize: 14,
                            color: AppColors.colorSubTitleTextColor),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      alignment: FractionalOffset.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Twitter
                          (model.twitterHandle.length != 0) ? socialContainer(AppImages.iconTwitter, model.twitterHandle) : Container(height: 0, width: 0),
                          // GitHub,
                          (model.github.length != 0) ? socialContainer(AppImages.iconGitHub, model.github) : Container(height: 0, width: 0),
                          // LinkedIn,
                          (model.linkedin.length != 0) ? socialContainer(AppImages.iconLinkedin, model.linkedin) : Container(height: 0, width: 0),
                          // Question,
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: IconButton(
                              color: Colors.redAccent,
                              icon: SvgPicture.asset(
                                AppImages.iconQuestion,
                              ),
                              onPressed: () {
                                Utility.launchURL(
                                    model.twitterHandle.length == 0
                                        ? model.linkedin
                                        : model.twitterHandle);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Apply Company Website
                    /*InkWell(
                      onTap: () {
                        Utility.launchURL(model.twitterHandle.length == 0
                            ? model.linkedin
                            : model.twitterHandle);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                            color: AppConstant.colorPrimary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Ask For a Mentorship Project",
                          style: theme.textTheme.button.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
          _companyInitial(theme),
        ],
      ),
    );
  }

  // Launch Color
  Color randomColor() {
    var color;
    if (model.mentor == Mentor.MENTOR) {
      color = AppColors.colorMentor;
    } else if (model.mentor == Mentor.MENTEE) {
      color = AppColors.colorMentee;
    } else {
      color = AppColors.colorBoth;
    }
    return color;
  }

  Widget socialContainer(String svgImg, String socialLink) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: IconButton(
        color: Colors.redAccent,
        icon: SvgPicture.asset(
          svgImg,
        ),
        onPressed: () {
          Utility.launchURL(socialLink);
        },
      ),
    );
  }
}
