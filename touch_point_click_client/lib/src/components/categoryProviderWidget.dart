import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/baseProviderWidgets.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';

class CategoryProviderWidget extends StatefulWidget {
  final UserServiceProvider userServiceProvider;
  final String userLocation;

  CategoryProviderWidget(this.userServiceProvider, this.userLocation);

  @override
  _CategoryProviderWidgetState createState() => _CategoryProviderWidgetState();
}

class _CategoryProviderWidgetState extends State<CategoryProviderWidget> {
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
      userServiceProvider,
      companyDetails(),
    );
  }

  bool favourite = false;

  Widget companyDetails() {
    return Column(
      verticalDirection: VerticalDirection.down,
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Company name
        Container(
          width: 200,
          child: AppTextStyles.normalText(
              userServiceProvider.name, FontWeight.normal, Colors.black, 1),
        ),

        SizedBox(width: 10.0),

        //Company description
        BaseProviderWidgets.companyDescription(
            userServiceProvider.description, 2),

        //Kilometers and Rating
        Container(
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BaseProviderWidgets.companyDetails(userServiceProvider.rating,
                    userServiceProvider.numRated, "150"), //favourite button
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
