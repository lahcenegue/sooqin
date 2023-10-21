import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/view/categories_view.dart';
import 'package:sooqin/view/login_mobile_view.dart';
import 'package:sooqin/view/main_view.dart';
import 'package:sooqin/view/more_view.dart';

class HomeContorller extends GetxController {
  final box = GetStorage();
  int selectedIndex = 0;
  List pages = [];

  @override
  void onInit() {
    pages = [
      MainView(),
      CategoriesView(),
      box.read('token') != null ? const Text('3') : LoginMobileView(),
      box.read('token') == null ? const Text('data') : const MoreView(),
    ];
    super.onInit();
  }

  void selectPage(int index) {
    selectedIndex = index;

    update();
  }
}
