import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchJobs.dart';
import 'package:find_mentor/page/home/jobs_page/jobs_list.dart';

class JobsDetailPage extends StatefulWidget {
  @override
  _JobsDetailPageState createState() => _JobsDetailPageState();
}

class _JobsDetailPageState extends State<JobsDetailPage> {
  bool isKeyboardVisible;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                          AppConstant.searchJobText),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: fetchJobs(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Jobs(jobs: snapshot.data)
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
