import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchMentors.dart';
import 'package:find_mentor/page/home/mentors_page/mentors_list.dart';

class MentorsDetailPage extends StatefulWidget {
  @override
  _MentorsDetailPageState createState() => _MentorsDetailPageState();
}

class _MentorsDetailPageState extends State<MentorsDetailPage> {
  bool isKeyboardVisible;

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: Colors.black38,
                      elevation: 4,
                      child: AppWidget.getSearchBox(isKeyboardVisible, context,
                          AppConstant.searchMentorText),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: fetchMentors(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Mentors(mentors: snapshot.data)
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CircularProgressIndicator(
                                            strokeWidth: 3,
                                            valueColor: AlwaysStoppedAnimation(
                                                AppConstant.colorPrimary),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
