// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/init/app_widget.dart';
import 'package:find_mentor/core/init/screen_util.dart';

class SearchBox extends StatelessWidget {
  final bool isKeyboardVisible;
  final bool isScrollSearchBody;
  final double searchBoxScrollPosition;
  final FocusNode focusNode;

  SearchBox({this.isKeyboardVisible, this.focusNode, this.isScrollSearchBody, this.searchBoxScrollPosition});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return AnimatedPositioned(
      duration: Duration(milliseconds: !isKeyboardVisible ? 220 : 0),
      top: isKeyboardVisible ? searchBoxScrollPosition : ScreenUtil.getHeight(context) * .35 - 26,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 220),
        opacity: !isScrollSearchBody && isKeyboardVisible ? 0.0 : 1.0,
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isKeyboardVisible ? AppColors.colorPrimary : Colors.transparent),
                    boxShadow: [
                      !isKeyboardVisible
                          ? BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5.0, offset: Offset(0, 10))
                          : BoxShadow(color: AppColors.colorPrimary.withOpacity(0.1), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 1)
                    ]),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Theme(
                  data: AppWidget.getThemeData().copyWith(primaryColor: Colors.grey),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: AppStrings.SEARCH_IN_NETWORK,
                            hintStyle: TextStyle(fontSize: 14, color: AppColors.colorBackButton),
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
                                searchController.text = "";
                              },
                            )
                          : Container()
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
                            padding: EdgeInsets.only(top: 12, bottom: 12, right: 4, left: 4),
                            child: Text(
                              AppStrings.CANCEL,
                              style: TextStyle(color: AppColors.colorHeading, fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
