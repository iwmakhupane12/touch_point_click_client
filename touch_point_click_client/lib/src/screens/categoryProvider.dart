import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/components/categoryProviderWidget.dart';
import 'package:touch_point_click_client/src/components/providerWidget.dart';

import 'package:touch_point_click_client/src/components/utilWidget.dart';
import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';

//Class for the clicked category to view its service provider
class CategoryProvider extends StatefulWidget {
  final List<UserServiceProvider> providerList;

  CategoryProvider(this.providerList);

  @override
  _CategoryProviderState createState() => _CategoryProviderState();
}

class _CategoryProviderState extends State<CategoryProvider> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<UserServiceProvider> _providerList = [];
  List<CategoryProviderWidget> _providerWidget = [];

  @override
  void initState() {
    super.initState();
    if (widget.providerList.length != 0) {
      _providerList = widget.providerList;
      setProviderWidgets();
    }
  }

  String userLocation = "3427K Section, Botshabelo, 9781";

  void setProviderWidgets() {
    for (int i = 0; i < _providerList.length; i++) {
      _providerWidget.add(
          CategoryProviderWidget(_providerList.elementAt(i), userLocation));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget.defaultScreen(
        context,
        _scaffoldKey,
        displayBody(),
        null,
        _providerList.elementAt(0).clickedCategory,
        null,
        null,
        null,
        true,
        AppColors.appBackgroundColor);
  }

  Widget displayBody() {
    return ListView(
      children: [
        UtilWidget.stickyHeader(
            "Select Service Provider",
            Column(
              children: _providerWidget,
            ),
            AppColors.appBackgroundColor),
      ],
    );
  }
}
