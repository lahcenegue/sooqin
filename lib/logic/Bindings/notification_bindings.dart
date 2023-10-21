import 'package:get/get.dart';
import 'package:sooqin/logic/controller/notification_controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
