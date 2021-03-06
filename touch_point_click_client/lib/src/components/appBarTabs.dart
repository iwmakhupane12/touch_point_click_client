import 'package:flutter/material.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

class AppBarTabs {
  static Widget twoAppBarBottomTabs(
    String tabOneTitle,
    String tabTwoTitle,
  ) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 2),
      ),
      tabs: [
        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tabOneTitle,
                style:
                    AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
              ),
            ),
          ),
        ),
        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tabTwoTitle,
                style:
                    AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget threeAppBarBottomTabs(
      String tabOneTitle, String tabTwoTitle, String tabThreeTitle) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 2),
      ),
      tabs: [
        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tabOneTitle,
                style:
                    AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
              ),
            ),
          ),
        ),
        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tabTwoTitle,
                style:
                    AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
              ),
            ),
          ),
        ),
        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tabThreeTitle,
                style:
                    AppTextStyles.normalBlack(FontWeight.normal, Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
