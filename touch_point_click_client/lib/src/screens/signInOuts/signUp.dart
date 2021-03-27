import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:country_calling_code_picker/picker.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/components/passwordTextEdit.dart';
import 'package:touch_point_click_client/src/components/phoneNumEditText.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';
import 'package:touch_point_click_client/src/screens/googleMapsScreen.dart';

class SignUp extends StatefulWidget {
  final Country country;

  SignUp(this.country);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController,
      _lastNameController,
      _phoneNumController,
      _emailController,
      _passwordController,
      _confirmPasswordController;

  Country _country;

  PhoneNumEditText phoneNumEditText;

  final FontWeight normal = FontWeight.normal;
  final FontWeight bold = FontWeight.bold;

  final Color black = Colors.black;
  final Color white = Colors.white;

  @override
  void initState() {
    super.initState();
    initControllers();
    _country = widget.country;

    phoneNumEditText = PhoneNumEditText(_phoneNumController, _country);
  }

  void initControllers() {
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneNumController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneNumController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget.clipedBase(
      ListView(
        children: [
          headerText("Name"),
          Padding(
            padding: padding,
            child: UtilWidget.txtInputText("", AppIconsUsed.personIcon,
                _nameController, TextInputType.text, true),
          ),
          headerText("Last Name"),
          Padding(
            padding: padding,
            child: UtilWidget.txtInputText("", AppIconsUsed.personIcon,
                _lastNameController, TextInputType.text, true),
          ),
          headerText("Phone Number"),
          Padding(
            padding: padding,
            child: phoneNumEditText,
          ),
          headerText("Email Address"),
          Padding(
            padding: padding,
            child: UtilWidget.txtInputText(
                "info@tpclick.co.za",
                AppIconsUsed.emailIcon,
                _emailController,
                TextInputType.emailAddress,
                true),
          ),
          headerText("Password"),
          Padding(
            padding: padding,
            child: PasswordTextEdit(_passwordController),
          ),
          headerText("Coonfirm Password"),
          Padding(
            padding: padding,
            child: PasswordTextEdit(_confirmPasswordController),
          ),
          signUpButton(),
          signUpDisclaimer(),
        ],
      ),
      AppColors.appBackgroundColor,
    );
  }

  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10.0);

  Widget headerText(String text) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 20.0, right: 20.0, bottom: 5.0),
      child: Text(
        text,
        style: AppTextStyles.normalBlack(normal, black),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  void checkControllers() {
    print("Name: ${_nameController.text}");
    print("Last Name: ${_lastNameController.text}");
    print("Phone Number: ${_phoneNumController.text}");
    print("Email Address: ${_emailController.text}");
    print("Password: ${_passwordController.text}");
    print("Confirm Password: ${_confirmPasswordController.text}");
  }

  Widget signUpButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            checkControllers();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoogleMapsScreen(),
              ),
            );
          },
          style: UtilWidget.buttonStyle,
          child: Text(
            "Sign Up",
            style: AppTextStyles.normalBlack(normal, white),
          ),
        ),
      ),
    );
  }

  Widget signUpDisclaimer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
      child: RichText(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.normalBlackSmall(normal, black),
          children: <TextSpan>[
            TextSpan(text: 'By clicking "Sign Up", you agree to our '),
            TextSpan(
                text: 'Terms of Service',
                style: AppTextStyles.normalBlackSmall(normal, Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Terms of Service');
                  }),
            TextSpan(text: ' and that you have read our '),
            TextSpan(
                text: 'Privacy Policy',
                style: AppTextStyles.normalBlackSmall(normal, Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Privacy Policy');
                  }),
          ],
        ),
      ),
    );
  }
}
