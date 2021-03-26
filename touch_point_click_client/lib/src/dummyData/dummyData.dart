import 'package:touch_point_click_client/src/components/categoryWidget.dart';
import 'package:touch_point_click_client/src/components/providerWidget.dart';
import 'package:touch_point_click_client/src/models/userServiceProvider.dart';

class DummyData {
  List<CategoryWidget> categoryList = [];
  List<ProviderWidget> providerList = [];

  DummyData() {
    setCategories();
    setFavourites();
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

    providerList.add(ProviderWidget(userServiceProvider1, userLocation));
    providerList.add(ProviderWidget(userServiceProvider2, userLocation));
    providerList.add(ProviderWidget(userServiceProvider3, userLocation));
    providerList.add(ProviderWidget(userServiceProvider4, userLocation));
    providerList.add(ProviderWidget(userServiceProvider5, userLocation));
    providerList.add(ProviderWidget(userServiceProvider6, userLocation));
    providerList.add(ProviderWidget(userServiceProvider7, userLocation));
    providerList.add(ProviderWidget(userServiceProvider8, userLocation));
    providerList.add(ProviderWidget(userServiceProvider9, userLocation));
    providerList.add(ProviderWidget(userServiceProvider10, userLocation));
    providerList.add(ProviderWidget(userServiceProvider11, userLocation));
    providerList.add(ProviderWidget(userServiceProvider12, userLocation));
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
    breakdown = "assets/images/categoryIcons/breakdown.png";
    spa = "assets/images/categoryIcons/day_spa.png";
    domesticService = "assets/images/categoryIcons/domestic_services.png";
    gym = "assets/images/categoryIcons/fitness_specialists.png";
    tutor = "assets/images/categoryIcons/homeschooling.png";
    mechanic = "assets/images/categoryIcons/mechanic.png";
    medical = "assets/images/categoryIcons/medical_practitioner.png";
    carwash = "assets/images/categoryIcons/mobile_car_wash.png";
    plumber = "assets/images/categoryIcons/plumber.png";
    chef = "assets/images/categoryIcons/private_chef.png";

    categoryList.add(CategoryWidget(electrician, "Electrician", 0));
    categoryList.add(CategoryWidget(beauty, "Hair & Beauty", 1));
    categoryList.add(CategoryWidget(breakdown, "Breakdown", 2));
    categoryList.add(CategoryWidget(spa, "Day Spa", 3));
    categoryList.add(CategoryWidget(domesticService, "Domestic Services", 4));
    categoryList.add(CategoryWidget(gym, "Fitness & Training", 5));
    categoryList.add(CategoryWidget(medical, "Medical Practitioner", 6));
    categoryList.add(CategoryWidget(carwash, "Mobile Carwash", 7));
    categoryList.add(CategoryWidget(plumber, "Plumber", 8));
    categoryList.add(CategoryWidget(tutor, "Tutors", 9));
    categoryList.add(CategoryWidget(chef, "Private Chef", 10));
    categoryList.add(CategoryWidget(mechanic, "Mechanic", 11));
    categoryList.add(CategoryWidget(electrician, "Electrician", 12));
    categoryList.add(CategoryWidget(beauty, "Hair & Beauty", 13));
    categoryList.add(CategoryWidget(breakdown, "Breakdown", 14));
    categoryList.add(CategoryWidget(spa, "Day Spa", 15));
    categoryList.add(CategoryWidget(domesticService, "Domestic Services", 16));
    categoryList.add(CategoryWidget(gym, "Fitness & Training", 17));
    categoryList.add(CategoryWidget(medical, "Medical Practitioner", 18));
    categoryList.add(CategoryWidget(carwash, "Mobile Carwash", 19));
    categoryList.add(CategoryWidget(plumber, "Plumber", 20));
    categoryList.add(CategoryWidget(tutor, "Tutors", 21));
    categoryList.add(CategoryWidget(chef, "Private Chef", 22));
    categoryList.add(CategoryWidget(mechanic, "Mechanic", 23));
  }
}
