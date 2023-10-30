import 'package:get/get.dart';
import 'package:sooqin/core/widgets/splash.dart';
import 'package:sooqin/logic/Bindings/add_ads_bindings.dart';
import 'package:sooqin/logic/Bindings/ads_bindings.dart';
import 'package:sooqin/logic/Bindings/favorite_bindings.dart';
import 'package:sooqin/logic/Bindings/listads_bindings.dart';
import 'package:sooqin/logic/Bindings/main_bindings.dart';
import 'package:sooqin/logic/Bindings/notification_bindings.dart';
import 'package:sooqin/view/add_ads.dart';
import 'package:sooqin/view/ads_view.dart';
import 'package:sooqin/view/categories_view.dart';
import 'package:sooqin/view/edit_profil_view.dart';
import 'package:sooqin/view/favorite_view.dart';
import 'package:sooqin/view/help_screen.dart';
import 'package:sooqin/view/home_view.dart';
import 'package:sooqin/view/list_ads_view.dart';
import 'package:sooqin/view/login_code_view.dart';
import 'package:sooqin/view/login_mobile_view.dart';
import 'package:sooqin/view/main_view.dart';
import 'package:sooqin/view/notifications_view.dart';

class AppRoutes {
  //initailRoute
  //static const home = Routes.homeScreen;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeView(),
      bindings: [
        MainBinding(),
      ],
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainView(),
    ),
    GetPage(
      name: Routes.loginPhone,
      page: () => LoginMobileView(),
    ),
    GetPage(
      name: Routes.loginCode,
      page: () => LoginCodeView(),
    ),
    GetPage(
      name: Routes.categoories,
      page: () => CategoriesView(),
    ),
    GetPage(
      name: Routes.listAds,
      page: () => ListAdsView(),
      binding: ListAdsBinding(),
    ),
    GetPage(
      name: Routes.adsPage,
      page: () => AdsView(),
      binding: AdsBinding(),
    ),
    GetPage(
      name: Routes.favoritePage,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: Routes.notificationPage,
      page: () => NotificationsView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfilScreen(),
    ),
    GetPage(
      name: Routes.help,
      page: () => const HelpView(),
    ),
    GetPage(
      name: Routes.addAds,
      page: () => AddAdsView(),
      binding: AddAdsBinding(),
    ),
  ];
}

class Routes {
  static const splash = '/';
  static const homeScreen = '/home';
  static const mainScreen = '/main';
  static const loginPhone = '/loginPhone';
  static const loginCode = '/loginCode';
  static const categoories = '/categories';
  static const listAds = '/listAds';
  static const adsPage = '/ads';
  static const favoritePage = '/favorite';
  static const notificationPage = '/notification';
  static const editProfile = '/edit';
  static const help = '/help';
  static const addAds = '/add';
}
