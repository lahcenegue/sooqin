import 'package:get/get.dart';
import 'package:sooqin/logic/controller/categories_controller.dart';
import 'package:sooqin/logic/controller/main_controller.dart';
import 'package:sooqin/logic/controller/notification_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainContorller(), permanent: true);
    Get.put(CategoriesController());
    Get.put(NotificationController());
  }
}
