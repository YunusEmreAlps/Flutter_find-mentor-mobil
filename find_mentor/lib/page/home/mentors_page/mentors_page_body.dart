import 'package:find_mentor/model/person.dart';
import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchMentors.dart';
import 'package:find_mentor/page/home/mentors_page/mentors_list.dart';
import 'package:scoped_model/scoped_model.dart';

class MentorsPageBody extends StatefulWidget {
  @override
  _MentorsPageBodyState createState() => _MentorsPageBodyState();
}

class _MentorsPageBodyState extends State<MentorsPageBody> {
  bool isKeyboardVisible;
  MentorModel model = MentorModel();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        print('Controller at bottom');
        model.fetchMentors();
      }
    });
    model.addListener(() {
      print('Change Occured');
    });
    model.fetchMentors();
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ScopedModel(
                            model: model,
                            child: ScopedModelDescendant<MentorModel>(
                              builder: (context, child, modelInstance) {
                                if (model.mentorsList.length > 0) {
                                  return ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: _getChildList(model.mentorsList),
                                  );
                                }
                                return Container();
                              },
                            ),
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

  _getChildList(List<Person> mentorList) {
    List<Widget> widgetList = [];
    mentorList.forEach((listElement) {
      widgetList.add(MentorCard(
        mentor: listElement,
      ));
    });
    if (widgetList.length > 0) {
      widgetList.add(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(AppConstant.colorPrimary),
              ),
            ],
          ),
        ),
      );
    }
    return widgetList;
  }
}
