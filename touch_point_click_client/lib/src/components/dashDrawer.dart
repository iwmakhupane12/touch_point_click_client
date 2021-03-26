import 'package:flutter/material.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';

import 'package:touch_point_click_client/src/screens/profile.dart';
import 'package:touch_point_click_client/src/screens/requests.dart';
import 'package:touch_point_click_client/src/screens/promotion.dart';
import 'package:touch_point_click_client/src/screens/about.dart';
import 'package:touch_point_click_client/src/screens/support.dart';
import 'package:touch_point_click_client/src/screens/splashScreen.dart';

class DashDrawer extends StatelessWidget {
  final FontWeight normal = FontWeight.normal;

  final Color black = Colors.black;
  final Color white = Colors.white;

  final List<String> btnNames = [
    "My Profile",
    "My Requests",
    "Promotion",
    "Support",
    "About",
    "Logout"
  ];

  final List<Widget> btnIcons = [
    AppIconsUsed.drawerCircularPersonIcon,
    AppIconsUsed.drawerRequestsIcon,
    AppIconsUsed.drawerPromotions,
    AppIconsUsed.drawerSupportIcon,
    AppIconsUsed.drawerAboutIcon,
    AppIconsUsed.drawerLogoutIcon
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Drawer(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return buttonsToDisplay(context, btnNames.elementAt(index),
                btnIcons.elementAt(index), index);
          },
        ),
      ),
    );
  }

  Widget buttonsToDisplay(
      BuildContext context, String name, Icon icon, int index) {
    return Column(
      children: [
        index == 0
            ? Container(
                height: 100,
                decoration: new BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30.0,
                            child: Icon(
                              Icons.person,
                              size: 50.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Touchpoint Click Pty(Ltd)',
                                style: AppTextStyles.normalBlack(normal, white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('info@tpclick.com',
                                  style: AppTextStyles.normalBlackSmall(
                                      normal, white),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        InkWell(
          onTap: () {
            changeScreen(context, name);
          },
          child: ListTile(
            leading: icon,
            title: Text(
              name,
              style: AppTextStyles.normalBlack(normal, black),
            ),
            trailing: AppIconsUsed.iosForwardArrowRounded,
          ),
        ),
        index.isEven || index == 5 ? Divider() : Container(),
        index == 5 ? becomeServiceProviderButton() : Container(),
      ],
    );
  }

  Widget becomeServiceProviderButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 50.0,
        child: ElevatedButton(
          onPressed: () {},
          style: UtilWidget.buttonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Become A Service Provider",
                style: AppTextStyles.normalBlack(normal, white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeScreen(BuildContext context, String btnClicked) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // ignore: missing_return
        builder: (context) {
          switch (btnClicked) {
            case "Profile":
              {
                return Profile();
              }
              break;
            case "Requests":
              {
                return Requests();
              }
              break;
            case "Promotion":
              {
                return Promotion();
              }
              break;
            case "About":
              {
                return About();
              }
              break;
            case "Support":
              {
                return Support();
              }
              break;
            case "Logout":
              {
                return SplashScreen();
              }
              break;
          }
        },
      ),
    );
  }
}
