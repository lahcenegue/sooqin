import 'package:get/get.dart';
import 'package:sooqin/logic/controller/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController());
  }
}
