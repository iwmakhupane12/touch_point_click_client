import 'package:touch_point_click_client/src/components/categoryWidget.dart';
import 'package:touch_point_click_client/src/components/providerWidget.dart';
import 'package:touch_point_click_client/src/models/providerService.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';

class DummyData {
  List<CategoryWidget> categoryList = [];
  List<ProviderWidget> providerList = [];
  List<UserServiceProvider> userServiceProvider = [];
  List<ProviderService> userServiceList = [];

  DummyData() {
    setFavourites();
    setCategories();
    setScheduleListData();
  }

  void setFavourites() {
    String userLocation = "3427 K Section, Botshabelo, 9781";

    UserServiceProvider userServiceProvider1 = UserServiceProvider();
    userServiceProvider1.id = "1";
    userServiceProvider1.name = "Avocado Beauty & Salon";
    userServiceProvider1.categories = ["Hair & Beauty"];
    userServiceProvider1.description =
        "Haircuts, Nails, Make-up, Hairfixes, Hair Wash, etc";
    userServiceProvider1.rating = "4.2";
    userServiceProvider1.numRated = "150";
    userServiceProvider1.imageLink =
        "assets/images/companyLogos/beauty_parlour.png";

    UserServiceProvider userServiceProvider2 = UserServiceProvider();
    userServiceProvider2.id = "2";
    userServiceProvider2.name = "BBT Breakdown Services";
    userServiceProvider2.categories = ["Breakdown"];
    userServiceProvider2.description = "We operate 24/7";
    userServiceProvider2.rating = "4.8";
    userServiceProvider2.numRated = "50";
    userServiceProvider2.imageLink = "assets/images/companyLogos/breakdown.png";

    UserServiceProvider userServiceProvider3 = UserServiceProvider();
    userServiceProvider3.id = "3";
    userServiceProvider3.name = "Capsys Private Chef Services";
    userServiceProvider3.categories = ["Private Chef"];
    userServiceProvider3.description = "We operate 24/7";
    userServiceProvider3.rating = "5.0";
    userServiceProvider3.numRated = "25";
    userServiceProvider3.imageLink = "assets/images/companyLogos/chef.png";

    UserServiceProvider userServiceProvider4 = UserServiceProvider();
    userServiceProvider4.id = "4";
    userServiceProvider4.name = "Zulu Warrior Mobile Spa";
    userServiceProvider4.categories = ["Day Spa"];
    userServiceProvider4.description = "We operate 24/7";
    userServiceProvider4.rating = "4.0";
    userServiceProvider4.numRated = "30";
    userServiceProvider4.imageLink = "assets/images/companyLogos/day_spa.png";

    UserServiceProvider userServiceProvider5 = UserServiceProvider();
    userServiceProvider5.id = "5";
    userServiceProvider5.name = "Mama Zuzu";
    userServiceProvider5.categories = ["Domestic Services"];
    userServiceProvider5.description = "Curtains, Ironing, etc";
    userServiceProvider5.rating = "3.8";
    userServiceProvider5.numRated = "500";
    userServiceProvider5.imageLink =
        "assets/images/companyLogos/domestic_services.png";

    UserServiceProvider userServiceProvider6 = UserServiceProvider();
    userServiceProvider6.id = "6";
    userServiceProvider6.name = "Izinyoka";
    userServiceProvider6.categories = ["Electrician"];
    userServiceProvider6.description = "We operate 24/7";
    userServiceProvider6.rating = "4.4";
    userServiceProvider6.numRated = "25";
    userServiceProvider6.imageLink =
        "assets/images/companyLogos/electrician.png";

    UserServiceProvider userServiceProvider7 = UserServiceProvider();
    userServiceProvider7.id = "7";
    userServiceProvider7.name = "Iron Feast Gym";
    userServiceProvider7.categories = ["Fitness & Training"];
    userServiceProvider7.description = "Irobics, etc";
    userServiceProvider7.rating = "4.9";
    userServiceProvider7.numRated = "30";
    userServiceProvider7.imageLink = "assets/images/companyLogos/gym.png";

    UserServiceProvider userServiceProvider8 = UserServiceProvider();
    userServiceProvider8.id = "8";
    userServiceProvider8.name = "Mabitsela & Son's Mechanic";
    userServiceProvider8.categories = ["Mechanic"];
    userServiceProvider8.description =
        "Any machenical issues, and panel beating";
    userServiceProvider8.rating = "4.8";
    userServiceProvider8.numRated = "175";
    userServiceProvider8.imageLink = "assets/images/companyLogos/mechanic.png";

    UserServiceProvider userServiceProvider9 = UserServiceProvider();
    userServiceProvider9.id = "9";
    userServiceProvider9.name = "Safisha Mobile Carwash Services";
    userServiceProvider9.categories = ["Mobile Carwash"];
    userServiceProvider9.description = "Interior and Exterior Wash";
    userServiceProvider9.rating = "4.0";
    userServiceProvider9.numRated = "300";
    userServiceProvider9.imageLink =
        "assets/images/companyLogos/mobile_car_wash.png";

    UserServiceProvider userServiceProvider10 = UserServiceProvider();
    userServiceProvider10.id = "10";
    userServiceProvider10.name = "Martin & Mazingo Plumbing Services";
    userServiceProvider10.categories = ["Plumber"];
    userServiceProvider10.description =
        "We deal with everything that has to do with plumbing";
    userServiceProvider10.rating = "4.0";
    userServiceProvider10.numRated = "250";
    userServiceProvider10.imageLink = "assets/images/companyLogos/plumber.png";

    UserServiceProvider userServiceProvider11 = UserServiceProvider();
    userServiceProvider11.id = "11";
    userServiceProvider11.name = "Mahupela Tutoring Services";
    userServiceProvider11.categories = ["Tutors"];
    userServiceProvider11.description =
        "Physical Sciences, life Sciences, Geography, English, Mathematics";
    userServiceProvider11.rating = "4.6";
    userServiceProvider11.numRated = "140";
    userServiceProvider11.imageLink = "assets/images/companyLogos/tutor.png";

    UserServiceProvider userServiceProvider12 = UserServiceProvider();
    userServiceProvider12.id = "12";
    userServiceProvider12.name = "Masgwerere Beauty & Salon";
    userServiceProvider12.categories = ["Hair & Beauty"];
    userServiceProvider12.description =
        "Haircuts, Nails, Make-up, Hairfixes, Hair Wash, etc";
    userServiceProvider12.rating = "3.1";
    userServiceProvider12.numRated = "300";
    userServiceProvider12.imageLink =
        "assets/images/companyLogos/beauty_parlour.png";

    userServiceProvider.add(userServiceProvider1);
    userServiceProvider.add(userServiceProvider2);
    userServiceProvider.add(userServiceProvider3);
    userServiceProvider.add(userServiceProvider4);
    userServiceProvider.add(userServiceProvider5);
    userServiceProvider.add(userServiceProvider6);
    userServiceProvider.add(userServiceProvider7);
    userServiceProvider.add(userServiceProvider8);
    userServiceProvider.add(userServiceProvider9);
    userServiceProvider.add(userServiceProvider10);
    userServiceProvider.add(userServiceProvider11);
    userServiceProvider.add(userServiceProvider12);

    for (int i = 0; i < userServiceProvider.length; i++) {
      providerList
          .add(ProviderWidget(userServiceProvider.elementAt(i), userLocation));
    }
  }

  void setCategories() {
    String electrician,
        beauty,
        breakdown,
        spa,
        domesticService,
        gym,
        plumber,
        mechanic,
        tutor,
        medical,
        carwash,
        chef;

    electrician = "assets/images/categoryIcons/electrician.png";
    beauty = "assets/images/categoryIcons/beauty_parlour.png";
    breakdown = "assets/images/categoryIcons/breakdown.jpeg";
    spa = "assets/images/categoryIcons/day_spa.png";
    domesticService = "assets/images/categoryIcons/domestic_services.png";
    gym = "assets/images/categoryIcons/fitness_specialists.png";
    tutor = "assets/images/categoryIcons/homeschooling.png";
    mechanic = "assets/images/categoryIcons/mechanic.png";
    medical = "assets/images/categoryIcons/medical_practitioner.png";
    carwash = "assets/images/categoryIcons/mobile_car_wash.png";
    plumber = "assets/images/categoryIcons/plumber.png";
    chef = "assets/images/categoryIcons/private_chef.png";

    categoryList.add(
        CategoryWidget(userServiceProvider, electrician, "Electrician", 0));
    categoryList
        .add(CategoryWidget(userServiceProvider, beauty, "Hair & Beauty", 1));
    categoryList
        .add(CategoryWidget(userServiceProvider, breakdown, "Breakdown", 2));
    categoryList.add(CategoryWidget(userServiceProvider, spa, "Day Spa", 3));
    categoryList.add(CategoryWidget(
        userServiceProvider, domesticService, "Domestic Services", 4));
    categoryList
        .add(CategoryWidget(userServiceProvider, gym, "Fitness & Training", 5));
    categoryList.add(CategoryWidget(
        userServiceProvider, medical, "Medical Practitioner", 6));
    categoryList
        .add(CategoryWidget(userServiceProvider, carwash, "Mobile Carwash", 7));
    categoryList
        .add(CategoryWidget(userServiceProvider, plumber, "Plumber", 8));
    categoryList.add(CategoryWidget(userServiceProvider, tutor, "Tutors", 9));
    categoryList
        .add(CategoryWidget(userServiceProvider, chef, "Private Chef", 10));
    categoryList
        .add(CategoryWidget(userServiceProvider, mechanic, "Mechanic", 11));
    categoryList.add(
        CategoryWidget(userServiceProvider, electrician, "Electrician", 12));
    categoryList
        .add(CategoryWidget(userServiceProvider, beauty, "Hair & Beauty", 13));
    categoryList
        .add(CategoryWidget(userServiceProvider, breakdown, "Breakdown", 14));
    categoryList.add(CategoryWidget(userServiceProvider, spa, "Day Spa", 15));
    categoryList.add(CategoryWidget(
        userServiceProvider, domesticService, "Domestic Services", 16));
    categoryList.add(
        CategoryWidget(userServiceProvider, gym, "Fitness & Training", 17));
    categoryList.add(CategoryWidget(
        userServiceProvider, medical, "Medical Practitioner", 18));
    categoryList.add(
        CategoryWidget(userServiceProvider, carwash, "Mobile Carwash", 19));
    categoryList
        .add(CategoryWidget(userServiceProvider, plumber, "Plumber", 20));
    categoryList.add(CategoryWidget(userServiceProvider, tutor, "Tutors", 21));
    categoryList
        .add(CategoryWidget(userServiceProvider, chef, "Private Chef", 22));
    categoryList
        .add(CategoryWidget(userServiceProvider, mechanic, "Mechanic", 23));
  }

  //initialize tutor services
  void setScheduleListData() {
    //Category 1 init
    ProviderService providerService1 = ProviderService();
    providerService1.id = "1";
    providerService1.category = "Sciences";
    providerService1.serviceDesc = "Mathematics";
    providerService1.price = 200;
    providerService1.estTime = "60";
    providerService1.chargeType = "Per Hour";
    providerService1.checked = false;

    ProviderService providerService2 = ProviderService();
    providerService2.id = "2";
    providerService2.category = "Sciences";
    providerService2.serviceDesc = "Physical Sciences";
    providerService2.price = 180;
    providerService2.estTime = "60";
    providerService2.chargeType = "Per Hour";
    providerService2.checked = false;

    ProviderService providerService3 = ProviderService();
    providerService3.id = "3";
    providerService3.category = "Sciences";
    providerService3.serviceDesc = "Life Scieces";
    providerService3.price = 150;
    providerService3.estTime = "60";
    providerService3.chargeType = "Per Hour";
    providerService3.checked = false;

    ProviderService providerService4 = ProviderService();
    providerService4.id = "4";
    providerService4.category = "Sciences";
    providerService4.serviceDesc = "Geography";
    providerService4.price = 150;
    providerService4.estTime = "60";
    providerService4.chargeType = "Per Hour";
    providerService4.checked = false;

    //Category 2 init
    ProviderService providerService5 = ProviderService();
    providerService5.id = "5";
    providerService5.category = "Commerce";
    providerService5.serviceDesc = "Accounting";
    providerService5.price = 200;
    providerService5.estTime = "60";
    providerService5.chargeType = "Per Hour";
    providerService5.checked = false;

    ProviderService providerService6 = ProviderService();
    providerService6.id = "6";
    providerService6.category = "Commerce";
    providerService6.serviceDesc = "Business Studies";
    providerService6.price = 150;
    providerService6.estTime = "60";
    providerService6.chargeType = "Per Hour";
    providerService6.checked = false;

    ProviderService providerService7 = ProviderService();
    providerService7.id = "7";
    providerService7.category = "Commerce";
    providerService7.serviceDesc = "Economics";
    providerService7.price = 150;
    providerService7.estTime = "60";
    providerService7.chargeType = "Per Hour";
    providerService7.checked = false;

    //Category 3 init
    ProviderService providerService8 = ProviderService();
    providerService8.id = "8";
    providerService8.category = "Histories";
    providerService8.serviceDesc = "History";
    providerService8.price = 150;
    providerService8.estTime = "60";
    providerService8.chargeType = "Per Hour";
    providerService8.checked = false;

    //Category 1
    userServiceList.add(providerService1);
    userServiceList.add(providerService2);
    userServiceList.add(providerService3);
    userServiceList.add(providerService4);

    //Category 2
    userServiceList.add(providerService5);
    userServiceList.add(providerService6);
    userServiceList.add(providerService7);

    //Category 3
    userServiceList.add(providerService8);
  }
}
