// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/app_widget.dart';
import 'package:find_mentor/core/init/system_overlay.dart';
import 'package:find_mentor/ui/components/homepage/bottom_sheet.dart';
import 'package:find_mentor/ui/components/homepage/find_mentor_cover.dart';
import 'package:find_mentor/ui/components/homepage/home_page_list_view.dart';
import 'package:find_mentor/ui/components/homepage/search_box.dart';
import 'package:find_mentor/ui/view/search/search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);
  FocusNode _searchFn = FocusNode();
  ScrollController _scrollController;
  double _searchBoxScrollPosition = 40;
  bool _isKeyboardVisible = false;
  bool _isScrollSearchBody = true;
  int _selectedCategory = 0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _searchBoxScrollPosition = 50 - _scrollController.offset;
          _isScrollSearchBody = _scrollController.offset <= 30;
        });
      });

    _searchFn.addListener(() {
      setState(() {
        _isKeyboardVisible = _searchFn.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayHelper.statusBarBrightness(_isKeyboardVisible),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              FindMentorCover(
                  isKeyboardVisible: _isKeyboardVisible,
                  context: context,
                  scale: 0.35),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: _isKeyboardVisible ? 102 : 52, bottom: 32),
                    child:
                        _isKeyboardVisible ? SearchPage() : HomePageListView(),
                  ),
                ),
              ),
            ],
          ),
          SearchBox(
            isKeyboardVisible: _isKeyboardVisible,
            focusNode: _searchFn,
            isScrollSearchBody: _isScrollSearchBody,
            searchBoxScrollPosition: _searchBoxScrollPosition,
          ),
          buildMoreButton()
        ],
      ),
    );
  }

  buildMoreButton() {
    return _isKeyboardVisible
        ? Container()
        : Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {
                    _onDrawerButtonPressed();
                  },
                )
              ],
            ),
          );
  }

  Widget _itemTopMenu(String heading) => Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
                _onDrawerButtonPressed();
              },
              child: new Icon(Icons.arrow_back_ios,
                  color: AppColors.colorBackButton, size: 13.0),
              shape: new CircleBorder(),
              elevation: 0,
              fillColor: AppColors.colorDrawerButton,
              padding: const EdgeInsets.all(15.0),
            ),
            Spacer(),
            Center(
              child: Text(heading,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.colorHeading,
                      fontWeight: FontWeight.w500)),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      );

  Widget get _buildDrawerItem => Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              FindMentorCover(
                  isKeyboardVisible: _isKeyboardVisible,
                  context: context,
                  scale: 0.20),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .14),
                  child: Column(
                    children: <Widget>[
                      Text(AppStrings.APP_DESCRIPTION,
                          style: TextStyle(
                              fontSize: 14, color: AppColors.colorDarkGrey)),
                    ],
                  ),
                ),
              ),
              AppWidget.pullDown(AppColors.colorPullDown1),
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: MaterialButton(
                  minWidth: 328,
                  height: 48,
                  elevation: 0,
                  color: AppColors.colorDrawerButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  child: Text(AppStrings.HOW_IT_WORKS,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorHeading)),
                  onPressed: () {
                    _onHowItWorksButtonPressed();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: MaterialButton(
                  minWidth: 328,
                  height: 48,
                  elevation: 0,
                  color: AppColors.colorDrawerButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  child: Text(AppStrings.CONTACT_US,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorHeading)),
                  onPressed: () {
                    _onIletisimButtonPressed();
                  },
                ),
              ),
            ],
          )
        ],
      );

  Widget _renderItem(StateSetter setState) => Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _selectedCategory = page;
                });
              },
              children: <Widget>[
                AppBottomSheetWidgets.buildIletisimItem(
                    _itemTopMenu(AppStrings.CONTACT_DETAILS)),
                AppBottomSheetWidgets.buildKatkiItem(
                    _itemTopMenu(AppStrings.FEEDBACK))
              ],
            ),
          ),
          AppBottomSheetWidgets.selectCategory(
              _horizontalCategoryItem(id: 0, title: AppStrings.CONTACT_US),
              _horizontalCategoryItem(id: 1, title: AppStrings.FEEDBACK))
        ],
      );

  Widget _horizontalCategoryItem({@required int id, @required String title}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = 1;
        });
        _pageController.animateToPage(_selectedCategory,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppColors.colorPageBg,
        height: MediaQuery.of(context).size.height * .10,
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: _selectedCategory == id
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 14)),
              SizedBox(height: 4),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 2,
                width: _selectedCategory == id ? title.length * 2.5 : 0,
                decoration: BoxDecoration(
                    color: AppColors.colorPrimary,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDrawerButtonPressed() {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {}
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .5,
          child: Container(
              child: _buildDrawerItem,
              decoration: AppBottomSheetWidgets.bottomSheetBoxDecoration),
        );
      },
    );
  }

  void _onHowItWorksButtonPressed() {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .5,
          child: Container(
            child: AppBottomSheetWidgets.buildHowItWorksItem(
                _itemTopMenu(AppStrings.HOW_IT_WORKS)),
            decoration: AppBottomSheetWidgets.bottomSheetBoxDecoration,
          ),
        );
      },
    );
  }

  void _onIletisimButtonPressed() {
    Navigator.pop(context);
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Container(
                child: _renderItem(setState),
                decoration: AppBottomSheetWidgets.bottomSheetBoxDecoration),
          ),
        );
      },
    );
  }
}
