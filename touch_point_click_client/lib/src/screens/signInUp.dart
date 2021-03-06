import 'package:flutter/material.dart';

import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/picker.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';

import 'package:touch_point_click_client/src/components/appBarTabs.dart';

import 'package:touch_point_click_client/src/screens/signInOuts/signIn.dart';
import 'package:touch_point_click_client/src/screens/signInOuts/signUp.dart';

class SignInUp extends StatefulWidget {
  final Country userCountry;

  SignInUp(this.userCountry);

  @override
  _SignInUpState createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  Country _userCountry;

  @override
  void initState() {
    super.initState();
    _userCountry = widget.userCountry;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 2.0,
          bottom: AppBarTabs.twoAppBarBottomTabs("Sign In", "Sign Up"),
          centerTitle: true,
          title: Image.asset('assets/images/logo_text_horizontal.png'),
          toolbarHeight: MediaQuery.of(context).size.height * .25,
        ),
        body: screenBody(),
      ),
    );
  }

  Widget screenBody() {
    return TabBarView(
      children: [
        SignIn(_userCountry),
        SignUp(_userCountry),
      ],
    );
  }
}
