// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:sooqin/routes/routes.dart';
// import 'package:sooqin/view/categories_view.dart';
// import 'package:sooqin/view/login_mobile_view.dart';
// import 'package:sooqin/view/main_view.dart';
// import 'package:sooqin/view/more_view.dart';
// import 'package:sooqin/view/my_account.dart';
// import 'package:sooqin/view/my_announces.dart';

// class HomeContorller extends GetxController {
//   final box = GetStorage();
//   int selectedIndex = 0;
//   List pages = [];

//   @override
//   void onInit() {
//     print(box.read('token'));
//     pages = [
//       MainView(),
//       CategoriesView(),
//       box.read('token') != null ? MyAnnoncesView() : LoginMobileView(),
//       box.read('token') != null ? MyAccountView() : const MoreView(),
//     ];
//     super.onInit();
//   }

//   void selectPage(int index) {
//     selectedIndex = index;
//     update();
//   }


// }
