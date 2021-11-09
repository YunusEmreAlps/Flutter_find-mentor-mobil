// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';

class AppWidget {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.colorPrimary,
      //accentColor: Colors.black,
      //toggleableActiveColor: Colors.black,
      //hintColor: Colors.black,

      backgroundColor: AppColors.colorPageBg,

      textTheme: TextTheme(
        display1: TextStyle(
            fontSize: AppConstants.fontSizeDisplay, fontWeight: FontWeight.bold),
        headline: TextStyle(
            fontSize: AppConstants.fontSizeHeadline,
            fontWeight: FontWeight.bold),
        title: TextStyle(
            fontSize: AppConstants.fontSizeTitle, fontWeight: FontWeight.bold),
        body1: TextStyle(fontSize: AppConstants.fontSizeBody),
        body2: TextStyle(
            fontSize: AppConstants.fontSizeBody2, fontWeight: FontWeight.bold),
        caption: TextStyle(
            fontSize: AppConstants.fontSizeCaption, fontWeight: FontWeight.bold),
      ),
      appBarTheme: AppBarTheme(brightness: Brightness.light),
    );
  }

  static Widget getSearchBox(isKeyboardVisible, context, pageHintText,
      {FocusNode focusNode}) {
    TextEditingController _searchController = TextEditingController();
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: isKeyboardVisible
                        ? Color(0xFFF3A5B1)
                        : Colors.transparent),
                boxShadow: [
                  !isKeyboardVisible
                      ? BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5.0,
                          offset: Offset(0, 10))
                      : BoxShadow(
                          color: AppColors.colorPrimary.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          spreadRadius: 1)
                ]),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Theme(
              data:
                  AppWidget.getThemeData().copyWith(primaryColor: Colors.grey),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      focusNode: focusNode,
                      onChanged: (searchText) {
                        // print(searchText);
                      },
                      decoration: InputDecoration(
                        hintText: pageHintText,
                        hintStyle: TextStyle(
                            fontSize: 14, color: AppColors.colorBackButton),
                        //
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: Icon(
                            Icons.search,
                            color: AppColors.colorBackButton,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  isKeyboardVisible
                      ? IconButton(
                          icon: Icon(
                            Icons.close,
                            color: AppColors.colorBackButton,
                            size: 20,
                          ),
                          onPressed: () {
                            _searchController.text = "";
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
        isKeyboardVisible
            ? AnimatedOpacity(
                opacity: !isKeyboardVisible ? 0.0 : 1.0,
                duration: Duration(milliseconds: 1000),
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 12, bottom: 12, right: 4, left: 4),
                        child: Text(
                          AppStrings.CANCEL,
                          style: TextStyle(
                              color: AppColors.colorHeading,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  static Widget pullDown(Color color) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: 58,
            height: 4,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(14))),
          ),
        ),
      );
}
