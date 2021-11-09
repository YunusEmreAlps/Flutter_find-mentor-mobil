// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/init/size_config.dart';
import 'package:find_mentor/core/model/job_model.dart';
import 'package:find_mentor/ui/components/jobsdetailpage/company_card.dart';
import 'package:find_mentor/ui/components/jobsdetailpage/job_description_card.dart';

class JobsDetailPageBody extends StatefulWidget {
  final Job jobDetail;
  const JobsDetailPageBody({Key key, this.jobDetail}) : super(key: key);
  @override
  _JobsDetailPageBodyState createState() => _JobsDetailPageBodyState();
}

class _JobsDetailPageBodyState extends State<JobsDetailPageBody> {
  bool isKeyboardVisible;
  final ScrollController controller = ScrollController();

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
                  SingleChildScrollView(
                    controller: controller,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    height: 65,
                                    width: double.infinity,
                                  ),
                                ),
                                CompanyCard(model: widget.jobDetail),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          JobDescriptionCard(
                              model: widget.jobDetail,
                              onApplyTap: () {
                                controller.animateTo(
                                    controller.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linearToEaseOut);
                              }),
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
