import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';

import 'package:touch_point_click_client/src/appUsedStylesSizes/appColors.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appIconsUsed.dart';
import 'package:touch_point_click_client/src/appUsedStylesSizes/appTextStyles.dart';

import 'package:touch_point_click_client/src/components/baseWidget.dart';
import 'package:touch_point_click_client/src/components/categoryWidget.dart';
import 'package:touch_point_click_client/src/components/dashDrawer.dart';
import 'package:touch_point_click_client/src/components/providerWidget.dart';
import 'package:touch_point_click_client/src/components/utilWidget.dart';

import 'package:touch_point_click_client/src/dummyData/dummyData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FontWeight normal = FontWeight.normal;
  final FontWeight bold = FontWeight.bold;

  final Color black = Colors.black;
  final Color blue = Colors.blue;
  final Color white = Colors.white;

  List<CategoryWidget> categoryList = [];
  List<Widget> homeCategory = [];
  List<ProviderWidget> providerList = [];

  @override
  void initState() {
    super.initState();
    DummyData dummyData = DummyData();
    categoryList = dummyData.categoryList;
    providerList = dummyData.providerList;
    print(providerList.length);
    setHomeCats();
    setBottomSheetCats();
    //setFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          elevation: 2.0,
          title: appBarLocation(),
          backgroundColor: white,
          actions: [appBarIconButton()],
        ),
        body: screenBody(),
        drawer: DashDrawer(),
      ),
    );
  }

  Widget screenBody() {
    return BaseWidget.clipedBase(
      Material(
          color: Colors.transparent,
          child: ListView(
            children: [
              slideShow(),
              SizedBox(height: 10.0),
              categoryWidgets(),
              favouriteWidgets()
            ],
          )),
    );
  }

  //Slideshow
  Widget slideShow() {
    return Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/homeSlideShow/bmw_audi_benz.jpg'),
          AssetImage('assets/images/homeSlideShow/golf_7_R_1.jpg'),
          AssetImage('assets/images/homeSlideShow/focusst_16.jpg'),
          AssetImage('assets/images/homeSlideShow/golf_7_R_2.jpg')
          //Image.network('https://bit.ly/2JobqhY'),
          //Image.network('https://bit.ly/3lvdFNr'),
          //Image.network('https://bit.ly/39CaMYL')
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
      ),
    );
  }

  //Category
  Widget categoryWidgets() {
    return UtilWidget.stickyHeaderDecorHeader(
      categoryHeader(),
      UtilWidget.baseCard(
        null,
        MediaQuery.of(context).size.width,
        homeCategoryWrap,
      ),
    );
  }

  Wrap homeCategoryWrap;

  void setHomeCats() {
    for (int i = 0; i < 8; i++) {
      homeCategory.add(categoryList.elementAt(i));
    }
    homeCategoryWrap = Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: homeCategory);
  }

  Widget categoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextStyles.normalText("Select Category", normal, black, 1),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isDismissible: true,
                builder: (ctx) => bottomSheetContent(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ));
          },
          style: UtilWidget.textButtonStyle,
          child: AppTextStyles.normalText("View All", normal, blue, 1),
        )
      ],
    );
  }

  Wrap categoryBottomSheet;

  void setBottomSheetCats() {
    categoryBottomSheet = Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: categoryList);
  }

  Widget bottomSheetContent() {
    return UtilWidget.bottomSheetHeaderContent(
      context,
      "Select Category",
      ListView(
        children: [categoryBottomSheet],
      ),
    );
  }

  //Favourites
  Widget favouriteWidgets() {
    return UtilWidget.stickyHeaderDecorHeader(
      favouriteHeader(),
      favourites(),
    );
  }

  Widget favourites() {
    return Column(children: providerList);
  }

  Widget favouriteHeader() {
    return Row(
      children: [
        AppTextStyles.normalText("Your Favourites", normal, black, 1),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }

  Widget appBarIconButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        backgroundColor: AppColors.appBackgroundColor,
        radius: 20,
        child: IconButton(
          icon: AppIconsUsed.notificationIcon,
          onPressed: () {},
        ),
      ),
    );
  }

  Widget appBarLocation() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Row(children: [
            AppIconsUsed.locationPin,
            AppTextStyles.normalSmallText("Current Location", normal, black, 1),
          ]),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: AppTextStyles.normalSmallSmallText(
                "3427 K Section, Botshabelo, 9781", normal, black, 1),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: AppTextStyles.normalText("Exit Application", bold, black, 1),
            content: AppTextStyles.normalSmallText(
                "Are you sure you want to exit?", normal, black, 1),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: AppTextStyles.normalSmallText("No", normal, blue, 1),
              ),
              new TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: AppTextStyles.normalSmallText("Yes", normal, blue, 1),
              ),
            ],
          ),
        )) ??
        false;
  }
}
