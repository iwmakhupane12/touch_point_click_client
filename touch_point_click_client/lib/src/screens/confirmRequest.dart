import 'package:flutter/material.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';
import 'package:touch_point_click_client/src/components/pickDateTime.dart';
import 'package:touch_point_click_client/src/screens/home.dart';

class ConfirmRequest extends StatefulWidget {
  @override
  _ConfirmRequestState createState() => _ConfirmRequestState();
}

class _ConfirmRequestState extends State<ConfirmRequest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _editingController, _serviceNoteController;

  PickDateTime pickDateTime;
  String date;
  String time;

  @override
  void initState() {
    super.initState();
    pickDateTime = PickDateTime();
    _editingController = TextEditingController();
    _serviceNoteController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _serviceNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget.defaultScreen(
        context,
        _scaffoldKey,
        displayBody(),
        null,
        "Company Name with subtitle of category",
        null,
        null,
        null,
        false,
        AppColors.appBackgroundColor);
  }

  Widget displayBody() {
    return ListView(
      children: [
        UtilWidget.stickyHeader(
            "Confirm Request",
            Column(
              children: [
                upperDetails(),
                centerDetails(),
                lowerDetails(),
                confirmRequestButton(),
              ],
            ),
            AppColors.appBackgroundColor),
      ],
    );
  }

  Widget upperDetails() {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Column(
        children: [
          serviceAddress(),
          setDateAndTime(),
          addArrivalNote(),
          addPromotionCode(),
        ],
      ),
    );
  }

  Widget upperBoldText(String text) {
    return AppTextStyles.normalSmallText(text, bold, black, 1);
  }

  Widget upperGreyText(String text) {
    return AppTextStyles.normalSmallText(text, normal, greyish, 2);
  }

  Widget serviceAddress() {
    return ListTile(
      onTap: () {},
      leading: AppIconsUsed.locationPinLarge,
      title: upperBoldText("Request Address"),
      subtitle: upperGreyText("3427 K Section, Botshabelo, 9781"),
      trailing: AppIconsUsed.iosForwardArrow,
    );
  }

  Widget setDateAndTime() {
    return ListTile(
      onTap: () async {
        await pickDateTime.chooseDate(context);
        await pickDateTime.chooseTime(context);
        setState(() {
          date = PickDateTime.convertDate(pickDateTime.getDate());
          time = PickDateTime.convertTime(pickDateTime.getTime());
        });
      },
      leading: AppIconsUsed.calendarIcon,
      title: upperBoldText("Set Date & Time"),
      subtitle: date != null && time != null
          ? upperGreyText("$date @ $time")
          : upperGreyText("Set Date & Time"),
      trailing: AppIconsUsed.iosForwardArrow,
    );
  }

  void openBottomSheet(String heading, int index, String buttonText) {
    _scaffoldKey.currentState.showBottomSheet(
      (ctx) => bottomSheetContent(
          heading, arrivalPromoText.elementAt(index), buttonText, index),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
    );
  }

  Widget bottomSheetContent(
      String heading, String previouseText, String buttonText, int index) {
    _editingController.text = previouseText;
    return UtilWidget.clipRectForApp(
      Container(
        color: AppColors.appBackgroundColor,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            UtilWidget.bottomSheetStickerContent(
              context,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 14.0, right: 10.0),
                    child: AppTextStyles.normalText(heading, normal, black, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: UtilWidget.txtInputTextMaxLines("Type here...", null,
                        _editingController, TextInputType.text, true, null),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          //Removing previous text and replacing it with new
                          arrivalPromoText.removeAt(index);
                          arrivalPromoText.insert(
                              index, _editingController.text);
                          Navigator.pop(context);
                        }),
                        style: UtilWidget.buttonStyle,
                        child: AppTextStyles.normalText(
                            buttonText, normal, white, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> arrivalPromoText = ["", ""];

  Widget addArrivalNote() {
    return ListTile(
      onTap: () {
        openBottomSheet("Add Arrival Note", 0, "Save Note");
      },
      leading: AppIconsUsed.arrivalNote,
      title: upperBoldText(
        arrivalPromoText.elementAt(0) != ""
            ? "Arrival Note"
            : "Add Arrival Note (Optional)",
      ),
      subtitle: upperGreyText(
        arrivalPromoText.elementAt(0) != ""
            ? arrivalPromoText.elementAt(0)
            : "No Arrival Note",
      ),
      trailing: AppIconsUsed.iosForwardArrow,
    );
  }

  Widget addPromotionCode() {
    return ListTile(
      onTap: () => openBottomSheet("Promotion Code", 1, "Apply Promo Code"),
      leading: AppIconsUsed.promoCode,
      title: upperBoldText("Promotion Code"),
      subtitle: upperGreyText(
        arrivalPromoText.elementAt(1) != ""
            ? arrivalPromoText.elementAt(1).toUpperCase()
            : "No Promo Code Entered",
      ),
      trailing: AppIconsUsed.iosForwardArrow,
    );
  }

  //**********Center Details***********//

  Widget centerDetails() {
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Column(
        children: [Text("Hello")],
      ),
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
        amountText(": R550", false),
        amountText(": R5", false),
        amountText(": R20", false),
        amountText(": R0", false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: amountText(": R575", true),
        ),
      ],
    );
  }

  final FontWeight normal = FontWeight.normal;
  final FontWeight bold = FontWeight.bold;

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color greyish = Colors.black54;

  Widget confirmRequestButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              changeScreen();
            },
            style: UtilWidget.buttonStyle,
            child:
                AppTextStyles.normalText("Confirm Request", normal, white, 1)),
      ),
    );
  }

  void changeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
