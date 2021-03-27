import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';
import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';
import 'package:touch_point_click_client/src/dummyData/dummyData.dart';
import 'package:touch_point_click_client/src/models/providerService.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';
import 'package:touch_point_click_client/src/screens/confirmRequest.dart';

//Class for showing clicked service provider services
class ProviderServices extends StatefulWidget {
  final UserServiceProvider userServiceProvider;
  final String userLocation;

  ProviderServices(this.userServiceProvider, this.userLocation);

  @override
  _ProviderServicesState createState() => _ProviderServicesState();
}

class _ProviderServicesState extends State<ProviderServices> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserServiceProvider userServiceProvider;
  String userLocation;

  List<ProviderService> userServiceList = [];
  List<String> categoriesList = [];
  List<ProviderService> selectedServices = [];

  @override
  void initState() {
    super.initState();
    DummyData dummyData = DummyData();
    userServiceList = dummyData.userServiceList;
    print(userServiceList.length);
    userServiceProvider = widget.userServiceProvider;
    userLocation = widget.userLocation;
    initCategories();
  }

  void initCategories() {
    categoriesList.add("Any");
    for (int i = 0; i < userServiceList.length; i++) {
      //Checks if the category is already in the list and if not, add it
      if (!categoriesList.contains(userServiceList.elementAt(i).category)) {
        categoriesList.add(userServiceList.elementAt(i).category);
      }
      /*print(userServiceList.elementAt(i).id);
      print(userServiceList.elementAt(i).category);
      print(userServiceList.elementAt(i).serviceDesc);
      print(userServiceList.elementAt(i).price);
      print(userServiceList.elementAt(i).estTime);
      print(userServiceList.elementAt(i).chargeType);
      print("///////////////////");*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget.defaultScreen(
        context,
        _scaffoldKey,
        getServices(),
        null,
        userServiceProvider.name,
        null,
        bottomNextButton(),
        null,
        false,
        AppColors.appBackgroundColor);
  }

  Widget bottomNextButton() {
    return InkWell(
      onTap: () => changeScreen(),
      child: Container(
          color: Colors.blue,
          height: 50,
          child: Align(
              alignment: Alignment.center,
              child: AppTextStyles.normalText("Next", normal, white, 1))),
    );
  }

  void changeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmRequest(),
      ),
    );
  }

  Widget getServices() {
    List<Widget> list = [];
    for (int i = 0; i < categoriesList.length; i++) {
      List<Widget> tempServicesList = [];
      for (int j = 0; j < userServiceList.length; j++) {
        if (userServiceList.elementAt(j).category ==
            categoriesList.elementAt(i)) {
          tempServicesList.add(
            service(
              j,
              userServiceList.elementAt(j).serviceDesc,
              userServiceList.elementAt(j).price,
              userServiceList.elementAt(j).chargeType,
            ),
          );
        }
      }

      //Dont display any category header that does not have any services
      if (tempServicesList.length > 0) {
        list.add(display(categoriesList.elementAt(i), tempServicesList));
      }
    }
    list.add(SizedBox(height: 20.0));
    return ListView(children: [
      UtilWidget.stickyHeader("Select Service(s)", Column(children: list),
          AppColors.appBackgroundColor)
    ]);
  }

  Widget display(String categorName, List<Widget> tempUserServicesList) {
    return ConfigurableExpansionTile(
      animatedWidgetFollowingHeader: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          Icons.expand_more,
          color: black,
          size: 30,
        ),
      ),
      initiallyExpanded: true,
      headerExpanded: category(categorName),
      header: category(categorName),
      headerBackgroundColorStart: AppColors.appBackgroundColor,
      headerBackgroundColorEnd: AppColors.appBackgroundColor,
      expandedBackgroundColor: AppColors.appBackgroundColor,
      children: tempUserServicesList,
    );
  }

  final FontWeight normal = FontWeight.normal;

  final Color black = Colors.black;
  final Color white = Colors.white;

  Widget category(String category) {
    return Container(
      height: 50,
      child: Row(
        children: [AppTextStyles.normalText(category, normal, black, 1)],
      ),
    );
  }

  Widget service(int serviceListIndex, String serviceDesc, String price,
      String chargeType) {
    int index = serviceListIndex;
    return UtilWidget.baseCard(
      null,
      MediaQuery.of(context).size.width,
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setCheckBoxChecked(index),
          borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              trailing: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: userServiceList.elementAt(index).checked,
                  onChanged: (value) => setCheckBoxChecked(index),
                ),
              ),
              title: Text(serviceDesc,
                  style: AppTextStyles.normalBlack(normal, black)),
              subtitle: Text("R$price \u00B7 $chargeType",
                  style: AppTextStyles.normalGreyishSmall()),
            ),
          ),
        ),
      ),
    );
  }

  void setCheckBoxChecked(int index) {
    setState(
      () {
        userServiceList.elementAt(index).checked =
            !userServiceList.elementAt(index).checked;
      },
    );
  }
}
