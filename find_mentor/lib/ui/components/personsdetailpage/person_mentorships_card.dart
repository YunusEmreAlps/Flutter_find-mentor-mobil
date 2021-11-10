// Flutter imports:
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:find_mentor/core/init/size_config.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_markdown/flutter_markdown.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';
import 'package:find_mentor/core/service/fetchReadMe.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonMentorshipsCard extends StatefulWidget {
  PersonMentorshipsCard({Key key, this.model, this.onApplyTap})
      : super(key: key);
  final Person model;
  final Function onApplyTap;

  @override
  _PersonMentorshipsCardState createState() => _PersonMentorshipsCardState();
}

class _PersonMentorshipsCardState extends State<PersonMentorshipsCard> {

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
                  AppStrings.ACTIVE_MENTORSHIPS,
                  style: TextStyle(
                      fontFamily: AppStrings.FONT_FAMILY,
                      fontSize: 16,
                      color: AppColors.colorGrey),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          // Active Mentorships w/ Developers
          Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.model.mentorships.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ExpansionTile(
                          leading:
                              SvgPicture.asset(AppImages.iconJoin, height: 20),
                          title: Text(
                            "${widget.model.mentorships[i].slug[0].toUpperCase() + widget.model.mentorships[i].slug.substring(1)}",
                            style: TextStyle(
                              fontFamily: AppStrings.FONT_FAMILY,
                              fontSize: SizeConfig.defaultSize * 1.8, // 18
                              color: AppColors.colorAppDescription,
                            ),
                          ),
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppStrings.CONTRIBUTED,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppStrings.FONT_FAMILY,
                                        fontSize: 16,
                                        color: AppColors.colortextDark
                                            .withOpacity(0.8),
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
                                          widget.model.mentorships[i]
                                              .contributors.length, (j) {
                                        return InkWell(
                                          onTap: () {
                                            Utility.launchURL(
                                                "https://findmentor.network/" +
                                                    widget
                                                        .model
                                                        .mentorships[i]
                                                        .contributors[j]
                                                        .fmnUrl);
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 2, 2, 2),
                                            child: Container(
                                              padding:
                                                  EdgeInsets.all(25 / 192 * 10),
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
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(50)),
                                                child: CachedNetworkImage(
                                                  imageUrl: widget
                                                      .model
                                                      .mentorships[i]
                                                      .contributors[j]
                                                      .avatar,
                                                  fit: BoxFit.contain,
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(
                                                          AppImages.pngUser),
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
                                    Divider(
                                      color: Color(0xFF898989),
                                      height: 1.5,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
