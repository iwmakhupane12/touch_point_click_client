import 'package:flutter/material.dart';

import 'package:touch_point_click_client/src/components/utilWidget.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

import 'package:touch_point_click_client/src/screens/home.dart';

class BaseWidget {
  static Widget clipedBase(Widget display, Color backgroundColor) {
    /*return UtilWidget.clipRectForApp(
      Container(
        color: Colors.white, //AppColors.appBackgroundColor,
        child: display,
      ),
    );*/
    return Container(
      color: backgroundColor, //AppColors.appBackgroundColor,
      child: display,
    );
  }

  static Widget defaultScreen(
      BuildContext context,
      Key scaffoldKey,
      Widget displayBody,
      Widget bottomWidget,
      String appBarTitle,
      FloatingActionButton floatingActionButton,
      Widget bottomNavigationBar,
      List<Widget> actions,
      bool toHome,
      Color appBackgroundColor) {
    bool _toHome = toHome;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        leading: InkWell(
          onTap: () => _toHome
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                )
              : Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          appBarTitle,
          style: AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
        ),
        bottom: bottomWidget,
        actions: actions,
      ),
      body: BaseWidget.clipedBase(displayBody, appBackgroundColor),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  static Widget defaultScreenNoCurve(BuildContext context, Widget displayBody,
      Widget bottomWidget, String appBarTitle) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          appBarTitle,
          style: AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
        ),
        bottom: bottomWidget,
      ),
      body: displayBody,
    );
  }
}
