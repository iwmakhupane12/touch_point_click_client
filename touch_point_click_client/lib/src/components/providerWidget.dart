import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/baseProviderWidgets.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';

class ProviderWidget extends StatefulWidget {
  final UserServiceProvider userServiceProvider;
  final String userLocation;

  ProviderWidget(this.userServiceProvider, this.userLocation);

  @override
  _ProviderWidgetState createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  UserServiceProvider userServiceProvider;
  String userLocation;

  @override
  void initState() {
    super.initState();
    userServiceProvider = widget.userServiceProvider;
    userLocation = widget.userLocation;
  }

  @override
  Widget build(BuildContext context) {
    return BaseProviderWidgets.companyDisplay(
      context,
      userServiceProvider.imageLink,
      userServiceProvider.name,
      userServiceProvider.categories.first,
      companyDetails(),
    );
  }

  bool favourite = false;

  String calculatedDistance = "150"; //Dummy value

  void calculateDistance() {
    //get client location and calculate.
  }

  Widget companyDetails() {
    return Column(
      verticalDirection: VerticalDirection.down,
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Company Category
        Text(
          userServiceProvider.categories.elementAt(
              0), //Compare with the one that the user selected after setting as favourite
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.appBlueColor),
        ),
        SizedBox(width: 10.0),
        //Service Provider Name
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(
              width: 200,
              child: AppTextStyles.normalSmallText(userServiceProvider.name,
                  FontWeight.normal, Colors.black, 1)),
        ),
        SizedBox(width: 10.0),
        //Company description
        BaseProviderWidgets.companyDescription(
            userServiceProvider.description, 1),

        //Kilometers and Rating
        Container(
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BaseProviderWidgets.companyDetails(
                    userServiceProvider.rating,
                    userServiceProvider.numRated,
                    calculatedDistance), //favourite button
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        favourite = !favourite;
                      });
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: BaseProviderWidgets.favouriteButton(favourite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
