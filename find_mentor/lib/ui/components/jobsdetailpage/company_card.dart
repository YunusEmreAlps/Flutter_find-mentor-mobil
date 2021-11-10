// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/job_model.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key key, this.model}) : super(key: key);
  final Job model;
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
          onTap: () {
            Utility.launchURL('https://www.${model.company}.com');
          },
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
                    AppColors.colorGreyLight.withOpacity(0.3),
                    AppColors.colorGreyLight.withOpacity(0.6)
                  ],
                  stops: [.5, 1],
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: CachedNetworkImage(
                  imageUrl: model.logo,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.pngCompanyImage),
                ),
              ),
            ),
          ),
        ),
        // Another Solution
        /*Text(
          model.company.substring(0, 1),
          style: theme.textTheme.headline3
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),*/
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
                SizedBox(height: 60),
                Center(
                  child: Text(
                    model.position,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: AppStrings.FONT_FAMILY,
                        fontSize: 18,
                        color: AppColors.colorHeading),
                  ),
                ),
                SizedBox(height: 8),
                // Apply Company Website
                InkWell(
                  onTap: () {
                    Utility.launchURL(model.address);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      AppStrings.APPLY_NOW,
                      style: theme.textTheme.button.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _companyInitial(theme),
        ],
      ),
    );
  }
}
