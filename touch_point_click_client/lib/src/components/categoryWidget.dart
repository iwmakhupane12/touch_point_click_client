import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryImageLink;
  final String categoryCaption;
  final int index;

  CategoryWidget(this.categoryImageLink, this.categoryCaption, this.index);
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
