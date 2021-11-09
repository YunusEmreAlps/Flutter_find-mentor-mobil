// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';

class IdiomCard extends StatelessWidget {
  final String title;
  final String content;

  const IdiomCard({Key key, @required this.title, @required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.only(left: 8, bottom: 4, top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$title',
                style: TextStyle(
                  fontSize: AppConstants.fontSizeIdiomCardTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '$content',
                style: TextStyle(
                  fontSize: AppConstants.fontSizeIdiomCardContent,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                width: 3,
                color: AppColors.colorParagraph2.withOpacity(.3),
              ),
            ),
          ),
          width: double.infinity,
        ),
      ),
    );
  }
}
