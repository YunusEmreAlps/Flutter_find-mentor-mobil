import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/util/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


// UI
import 'package:find_mentor/page/home/home_page.dart';
import 'package:find_mentor/page/home/jobs_page/jobs_page.dart';
import 'package:find_mentor/page/home/events_page/events_page.dart';
import 'package:find_mentor/page/home/mentors_page/mentors_page.dart';
import 'package:find_mentor/page/home/mentees_page/mentees_page.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

// Mentorships (+)
// Mentors
// Mentees
// Home (+)
// Events (+)
// Jobs (+)
// Job Seekers

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentPage = 2;

  List<Widget> _pages = [EventsPage(), JobsPage(), HomePage(), MentorsPage(), MenteesPage()];
  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: AppConstant.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppConstant.colorPrimary,
        elevation: 0.5,
        //height causes layout overflow on some devies
        //height: 56,
        onTap: (int val) {
          if (val == _currentPage) return;
          setState(() {
            _currentPage = val;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.fixedCircle,
        items: <TabItem>[
          TabItem(icon: Icons.event_outlined, title: ''),
          TabItem(icon: Icons.work_outline, title: ''),
          TabItem(icon: Icons.supervised_user_circle_outlined, title: ''),
          TabItem(icon: Icons.school_outlined, title: ''), // fiber_smart_record_outlined
          TabItem(icon: Icons.local_library_outlined, title: ''), // group, people_alt_outlined, person_outline, cast_for_education_outlined
        ],
      ),
      body: _pages[_currentPage],
    );
  }
}
