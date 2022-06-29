// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';

class HistoryBodyList extends StatelessWidget {
  HistoryBodyList({this.historyWord});

  final String historyWord;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(top: 24, right: 242, bottom: 12, left: 24),
          child: Text(
            AppStrings.SEARCH_HISTORY.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: AppColors.colorParagraph2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            historyWord,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: AppColors.colorHeading),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
