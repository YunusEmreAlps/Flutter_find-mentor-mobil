import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchMentees.dart';
import 'package:find_mentor/page/home/mentees_page/mentees_list.dart';

class MenteesDetailPage extends StatefulWidget {
  @override
  _MenteesDetailPageState createState() => _MenteesDetailPageState();
}

class _MenteesDetailPageState extends State<MenteesDetailPage> {
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
                          AppConstant.searchMenteeText),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: fetchMentees(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Mentees(mentees: snapshot.data)
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
