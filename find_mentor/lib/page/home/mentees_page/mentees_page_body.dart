import 'package:find_mentor/model/person.dart';
import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchMentees.dart';
import 'package:find_mentor/page/home/mentees_page/mentees_list.dart';
import 'package:scoped_model/scoped_model.dart';

class MenteesPageBody extends StatefulWidget {
  @override
  _MenteesPageBodyState createState() => _MenteesPageBodyState();
}

class _MenteesPageBodyState extends State<MenteesPageBody> {
  bool isKeyboardVisible;
  MenteeModel model = MenteeModel();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        print('Controller at bottom');
        model.fetchMentees();
      }
    });
    model.addListener(() {
      print('Change Occured');
    });
    model.fetchMentees();
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
                          AppConstant.searchMenteeText),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ScopedModel(
                            model: model,
                            child: ScopedModelDescendant<MenteeModel>(
                              builder: (context, child, modelInstance) {
                                if (model.menteesList.length > 0) {
                                  return ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: _getChildList(model.menteesList),
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

  _getChildList(List<Person> menteeList) {
    List<Widget> widgetList = [];
    menteeList.forEach((listElement) {
      widgetList.add(MenteeCard(
        mentees: listElement,
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
