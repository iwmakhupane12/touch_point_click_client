import 'package:flutter/material.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

import 'package:touch_point_click_client/src/components/utilWidget.dart';

class RequestReceipt extends StatefulWidget {
  @override
  _RequestReceiptState createState() => _RequestReceiptState();
}

class _RequestReceiptState extends State<RequestReceipt> {
  final FontWeight normal = FontWeight.normal;
  final FontWeight bold = FontWeight.bold;

  final Color black = Colors.black;
  final Color white = Colors.white;
  final Color greyish = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UtilWidget.stickyHeader(
          "Reqest ID: 456987",
          details(),
          AppColors.appBackgroundColor,
        ),
      ],
    );
  }

  Widget details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        services(),
        lowerDetails(),
        resendButton(),
      ],
    );
  }

  Widget services() {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Column(
        children: [
          headers(),
          Divider(),
          requestedService(1, "Mathematics", 200),
        ],
      ),
    );
  }

  /*Widget servicesColumn() {
    List<Widget> tempServices = [];
    for (int i = 0; i < _services.length; i++) {
      tempServices.add(clickedService(
          1, _services.elementAt(i).serviceDesc, _services.elementAt(i).price));
    }
    return Column(children: tempServices);
  }*/

  Widget headers() {
    return ListTile(
      leading: AppTextStyles.normalText("Qty", bold, black, 2),
      title: AppTextStyles.normalText("Service", bold, black, 2),
      trailing: AppTextStyles.normalText("Price", bold, black, 2),
    );
  }

  Widget requestedService(int qty, String service, double price) {
    return ListTile(
      leading: AppTextStyles.normalText("$qty", normal, black, 1),
      title: AppTextStyles.normalText("$service", normal, black, 2),
      trailing: AppTextStyles.normalText("R$price", normal, black, 2),
    );
  }

  Widget lowerDetails() {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [columnHeader(), columnPrice()],
        ),
      ),
    );
  }

  Widget amountText(String text, bool last) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: AppTextStyles.normalSmallText(
          text, last ? bold : normal, last ? black : greyish, 1),
    );
  }

  Widget columnHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        amountText("Sub Total", false),
        amountText("Service Fee", false),
        amountText("Distance Fee", false),
        amountText("Promo Discount", false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: amountText("Total", true),
        ),
      ],
    );
  }

  Widget columnPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        amountText("R550", false),
        amountText("R5", false),
        amountText("R20", false),
        amountText("R0", false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: amountText("R575", true),
        ),
      ],
    );
  }

  Widget resendButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {},
          style: UtilWidget.buttonStyle,
          child: AppTextStyles.normalText("Resend Receipt", normal, white, 1),
        ),
      ),
    );
  }
}
