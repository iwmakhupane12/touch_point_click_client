import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';

class RequestDetails extends StatefulWidget {
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
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
            "Reqest ID: 456987", details(), AppColors.appBackgroundColor)
      ],
    );
  }

  Widget details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText("Status"),
        cancelledBy(),
        headingText("Service Provider"),
        usersDetails(
          "Service Provider Name",
          "15423 Grassland, Heidedal, Bloemfontein, 9300",
          "info@tpclick.co.za",
          "+27629760527",
        ),
        headingText("Request"),
        requestConstraints(),
        headingText("Services"),
        services(),
        headingText("Amounts"),
        lowerDetails(),
      ],
    );
  }

  Widget cancelledBy() {
    return UtilWidget.baseCard(
      40,
      MediaQuery.of(context).size.width,
      Center(
        child: AppTextStyles.normalText(
            "Cancelled By Service Provider", normal, black, 1),
      ),
    );
  }

  Widget headingText(String text) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 10.0, right: 10.0),
      child: Text(text,
          style: AppTextStyles.normalBlack(normal, Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1),
    );
  }

  Widget spaceBetweenSmallText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: AppTextStyles.normalSmallText(text, normal, black, 2),
    );
  }

  Widget spaceBetweenText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: AppTextStyles.normalText(text, normal, black, 2),
    );
  }

  Widget usersDetails(
      String userName, String address, String email, String phone) {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: AppTextStyles.normalText(userName, bold, black, 2),
            ),
            spaceBetweenSmallText(address),
            spaceBetweenSmallText(email),
            spaceBetweenSmallText(phone),
            rating("4.3", "300", "10"),
          ],
        ),
      ),
    );
  }

  Widget rating(String rating, String ratedNumber, String distance) {
    return Container(
      child: Row(
        children: <Widget>[
          AppIconsUsed.greyRatingStar,
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
                //"4.3 (200+) \u00B7 10km away"
                rating +
                    " (" +
                    ratedNumber +
                    ") \u00B7 " +
                    distance +
                    "km away",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.normalBlackSmallSmall(
                    FontWeight.normal, Colors.grey[600])),
          ),
        ],
      ),
    );
  }

  Widget requestConstraints() {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Column(
        children: [
          constraintsTile(AppIconsUsed.locationPinLarge, "Client Address",
              "3427 K Section, Botshabelo, 9781"),
          constraintsTile(
              AppIconsUsed.calendarIcon, "Date & Time", "21 Mar 2021 @ 14:00"),
          constraintsTile(AppIconsUsed.arrivalNote, "Arrival Note", "No note"),
          constraintsTile(AppIconsUsed.cardPayment, "Payment Method", "Cash")
        ],
      ),
    );
  }

  Widget constraintsTile(Icon trailingIcon, String title, String subTitle) {
    return ListTile(
      leading: trailingIcon,
      title: AppTextStyles.normalSmallText(title, normal, black, 2),
      subtitle: AppTextStyles.normalSmallText(subTitle, normal, greyish, 3),
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
          requestedService(1, "Mathematics", 200, "Note: kdjfbdkjb"),
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

  Widget requestedService(int qty, String service, double price, String note) {
    return ListTile(
      leading: AppTextStyles.normalText("$qty", normal, black, 1),
      title: AppTextStyles.normalText("$service", normal, black, 2),
      subtitle: AppTextStyles.normalSmallText("$note", normal, greyish, 3),
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
}
