// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/init/fade_animation.dart';
import 'package:find_mentor/ui/components/searchpage/history_body_list.dart';
import 'package:find_mentor/ui/components/searchpage/vowels.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    return buildFadeAnimation();
  }

  FadeAnimation buildFadeAnimation() {
    return FadeAnimation(
      0.3,
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Vowels(),
              HistoryBodyList(
                historyWord: 'Network',
              )
            ],
          )
        ],
      ),
    );
  }
}
