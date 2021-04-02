import 'package:flutter/material.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

import 'package:touch_point_click_client/src/components/appBarTabs.dart';
import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';
import 'package:touch_point_click_client/src/screens/myRequests/pastRequests.dart';
import 'package:touch_point_click_client/src/screens/myRequests/upcomingRequests.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  final FontWeight normal = FontWeight.normal;
  final FontWeight bold = FontWeight.bold;

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color greyish = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BaseWidget.defaultScreen(
          context,
          null,
          displayBody(),
          AppBarTabs.twoAppBarBottomTabs("Upcoming", "Past"),
          "My Requests",
          null,
          null,
          null,
          true,
          AppColors.appBackgroundColor),
    );
  }

  Widget displayBody() {
    return TabBarView(
      children: [
        ListView(children: [requestInfo()]),
        ListView(children: [requestInfo()])
      ],
    );
  }

  void changeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpcomingRequests(),
      ),
    );
  }

  //Pass a request object
  Widget requestInfo() {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            changeScreen();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyles.normalText(
                      "Category Name", FontWeight.w500, Colors.blue, 1),
                  SizedBox(width: 20.0),
                  AppTextStyles.normalText(
                      "Avocado Painting", normal, black, 1),
                  SizedBox(width: 20.0),
                  Divider(),
                  AppTextStyles.normalSmallText(
                      "orderDate @ orderTime", normal, greyish, 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextStyles.normalSmallText(
                          "Request Id: orderNumber", normal, greyish, 1),
                      orderStatus("Cancelled"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget orderStatus(String status) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: returnStatusColors(status)),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextStyles.normalSmallSmallText(status, normal, white, 1),
        ),
      ),
    );
  }

  //I will use status to compare the status
  //strings and the incoming status to set the status button
  static const String pendingAcceptance = "Pending Acceptance";
  static const String accepted = "Accepted";
  static const String canceled = "Cancelled";
  static const String current = "Current";

  static final Color pendingAcceptanceColor = Colors.orange;
  static final Color acceptedColor = Colors.teal[800];
  static final Color canceledColor = Colors.red;
  static final Color currentColor = Colors.blue;

  static Color returnStatusColors(String status) {
    switch (status) {
      case pendingAcceptance:
        {
          return pendingAcceptanceColor;
        }
        break;
      case accepted:
        {
          return acceptedColor;
        }
        break;
      case canceled:
        {
          return canceledColor;
        }
        break;
      case current:
        {
          return currentColor;
        }
        break;
      default:
        return Colors.blue;
    }
  }
}
