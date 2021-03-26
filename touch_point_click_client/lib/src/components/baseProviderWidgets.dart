import 'package:flutter/material.dart';

//import 'package:touch_point_click/src/screens/chooseServices.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';

class BaseProviderWidgets {
  static Widget companyDisplay(
    BuildContext context,
    String imageLink,
    String companyName,
    String companyCategory,
    Column companyDetails,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: FittedBox(
          child: InkWell(
            onTap: () => companyClicked(
                context, companyName, companyCategory, imageLink),
            splashColor: Color(0x802196F3),
            borderRadius: BorderRadius.circular(15.0),
            child: Material(
              color: Colors.white,
              elevation: 2.0,
              borderRadius: BorderRadius.circular(15.0),
              //shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        fit: BoxFit.fill,
                        alignment: Alignment.topLeft,
                        image: AssetImage(imageLink),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: companyDetails,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void companyClicked(BuildContext context, String companyName,
      String companyCategory, String imageLink) {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseServices(
          companyName: companyName,
          categoryName: companyCategory,
          imageLink: imageLink,
        ),
      ),
    );*/
  }

  static Widget companyDescription(String companyDesc, int expandTextLines) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Container(
        width: 200,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: Text(
                companyDesc,
                maxLines: expandTextLines,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget companyDetails(
      String companyRating, String companyRatedNumber, String companyDistance) {
    return Container(
      child: Row(
        children: <Widget>[
          AppIconsUsed.greyRatingStar,
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              //"4.3 (200+) \u00B7 10km away"
              companyRating +
                  " (" +
                  companyRatedNumber +
                  ") \u00B7 " +
                  companyDistance +
                  "km away",
              style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  static Widget favouriteButton(bool favourite) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: favourite
            ? AppIconsUsed.favouriteTrue
            : AppIconsUsed.favouriteFalse);
  }
}
