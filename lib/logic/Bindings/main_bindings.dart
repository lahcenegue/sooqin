import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/logic/controller/categories_controller.dart';
import 'package:sooqin/logic/controller/main_controller.dart';
import 'package:sooqin/logic/controller/my_account_controller.dart';
import 'package:sooqin/logic/controller/my_annonce_controller.dart';
import 'package:sooqin/logic/controller/notification_controller.dart';

class MainBinding implements Bindings {
  final box = GetStorage();

  @override
  void dependencies() {
    Get.put(MainContorller(), permanent: true);
    Get.put(CategoriesController());
    Get.put(NotificationController());

    if (box.read('token') != null) {
      Get.put(MyAnnonceController());
      Get.put(MyAccountController());
    }
  }
}
