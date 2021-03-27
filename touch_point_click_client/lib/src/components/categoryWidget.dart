import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';
import 'package:touch_point_click_client/src/screens/categoryProvider.dart';

//Class to view a category

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  final String categoryImageLink;
  final String categoryCaption;
  final int index;
  final List<UserServiceProvider> userServiceProvider;
  List<UserServiceProvider> tempUserServiceProvider = [];

  CategoryWidget(this.userServiceProvider, this.categoryImageLink,
      this.categoryCaption, this.index);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryCompanies(
                appBarTitle: imageCaption,
              ),
            ),
          );*/
          UtilWidget.showLoadingDialog(context, "");
          for (int i = 0; i < userServiceProvider.length; i++) {
            for (int j = 0;
                j < userServiceProvider.elementAt(i).categories.length;
                j++) {
              if (userServiceProvider.elementAt(i).categories.elementAt(j) ==
                  categoryCaption) {
                //Setting the service provider category
                userServiceProvider.elementAt(i).clickedCategory =
                    categoryCaption;
                //adding the service provider into the list of that category
                tempUserServiceProvider.add(userServiceProvider.elementAt(i));
              }
            }
          }
          Timer(
            Duration(seconds: 2),
            () {
              Navigator.pop(context); //Remove loaidng pop
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryProvider(tempUserServiceProvider),
                ),
              );
            },
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            height: 100,
            width: 90,
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0), //Space
                Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      categoryImageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5.0), //Space
                Expanded(
                  child: Text(
                    categoryCaption,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.normalBlackSmallSmall(
                        FontWeight.normal, Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
