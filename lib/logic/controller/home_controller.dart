import 'package:get/get.dart';

class HomeContorller extends GetxController {
  int selectedIndex = 0;

  void selectPage(int index) {
    selectedIndex = index;
    update();
  }
}
