import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/appBarTabs.dart';
import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/screens/myRequests/requestInvoice.dart';
import 'package:touch_point_click_client/src/screens/myRequests/requestReceipt.dart';
import 'package:touch_point_click_client/src/screens/myRequests/requestTracking.dart';
import 'package:touch_point_click_client/src/screens/myRequests/requestDetails.dart';

class UpcomingRequests extends StatefulWidget {
  @override
  _UpcomingRequestsState createState() => _UpcomingRequestsState();
}

class _UpcomingRequestsState extends State<UpcomingRequests> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: BaseWidget.defaultScreen(
          context,
          null,
          displayBody(),
          AppBarTabs.threeAppBarBottomTabs("Tracking", "Receipt", "Details"),
          "Upcoming Request",
          null,
          payInvoiceButton(),
          null,
          false,
          AppColors.appBackgroundColor),
    );
  }

  Widget payInvoiceButton() {
    return InkWell(
      onTap: () {}, // => changeScreen(),
      child: Container(
          color: Colors.blue,
          height: 50,
          child: Align(
              alignment: Alignment.center,
              child: AppTextStyles.normalText(
                  "Pay Invoice", FontWeight.normal, Colors.white, 1))),
    );
  }

  Widget displayBody() {
    return TabBarView(
      children: [
        RequestTracking(),
        RequestReceipt(), //RequestInvoice(),
        RequestDetails(),
      ],
    );
  }
}
