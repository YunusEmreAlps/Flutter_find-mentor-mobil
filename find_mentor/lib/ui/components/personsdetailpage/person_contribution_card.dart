// Flutter imports:
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_mentor/core/init/size_config.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_markdown/flutter_markdown.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';
import 'package:find_mentor/core/service/fetchReadMe.dart';

class PersonContributionCard extends StatelessWidget {
  const PersonContributionCard({Key key, this.model, this.onApplyTap})
      : super(key: key);
  final Person model;
  final Function onApplyTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.CONTRIBUTED,
                  style: TextStyle(
                      fontFamily: AppStrings.FONT_FAMILY,
                      fontSize: 16,
                      color: AppColors.colorGrey),
                ),
              ],
            ),
          ),
          // Contributed
          Container(
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
                            if (model.contributions[index].contributors.length >
                                0) {
                              return InkWell(
                                onTap: () {
                                  Utility.launchURL(
                                      model.contributions[index].projectAdress);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    left: index == 0 ? 0 : 10.0,
                                    right: index ==
                                            model.contributions[index]
                                                    .contributors.length -
                                                1
                                        ? 10
                                        : 0,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFB5BFD0)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    "${model.contributions[index].slug[0].toUpperCase() + model.contributions[index].slug.substring(1)}",
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
                          itemCount: model.contributions.length),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Contributed w/ Developers
          Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.contributions.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${model.contributions[i].slug[0].toUpperCase() + model.contributions[i].slug.substring(1)}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: AppStrings.FONT_FAMILY,
                            fontSize: 18,
                            color: AppColors.colortextDark.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          "${model.contributions[i].goal}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: AppStrings.FONT_FAMILY,
                            fontSize: 12,
                            // color: Color(0xFFB5BFD0),
                            color: Color(0xFF898989),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 6,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          children: List.generate(
                              model.contributions[i].contributors.length, (j) {
                            return InkWell(
                              onTap: () {
                                Utility.launchURL(
                                    "https://findmentor.network/" +
                                        model.contributions[i].contributors[j]
                                            .fmnUrl);
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: Container(
                                  padding: EdgeInsets.all(25 / 192 * 10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        AppColors.colorGreyLight
                                            .withOpacity(0.3),
                                        AppColors.colorGreyLight
                                            .withOpacity(0.6)
                                      ],
                                      stops: [.5, 1],
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    child: CachedNetworkImage(
                                      imageUrl: model.contributions[i]
                                          .contributors[j].avatar,
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) =>
                                          Image.asset(AppImages.pngUser),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
