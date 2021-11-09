// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/init/size_config.dart';
import 'package:find_mentor/core/model/person.dart';
import 'package:find_mentor/core/service/fetchReadMe.dart';
import 'package:find_mentor/ui/components/personsdetailpage/person_card.dart';
import 'package:find_mentor/ui/components/personsdetailpage/person_description_card.dart';
import 'package:find_mentor/ui/components/personsdetailpage/person_github_card.dart';

class PersonsDetailPageBody extends StatefulWidget {
  final Person personDetail;
  const PersonsDetailPageBody({Key key, this.personDetail}) : super(key: key);
  @override
  _PersonsDetailPageBodyState createState() => _PersonsDetailPageBodyState();
}

class _PersonsDetailPageBodyState extends State<PersonsDetailPageBody> {
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
                                PersonCard(model: widget.personDetail),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          PersonDescriptionCard(
                              model: widget.personDetail,
                              onApplyTap: () {
                                controller.animateTo(
                                    controller.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linearToEaseOut);
                              }),
                          SizedBox(height: 16),
                          (widget.personDetail.github.length != 0) 
                          ? FutureBuilder(
                            future: fetchReadMe(widget.personDetail.github.substring(19)),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return PersonGitHubCard(
                                  model: widget.personDetail,
                                  onApplyTap: () {
                                    controller.animateTo(
                                        controller.position.maxScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.linearToEaseOut);
                                  },
                                );
                              }
                              return Container();
                            },
                          ) : Container(),
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
