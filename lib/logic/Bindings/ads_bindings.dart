import 'package:get/get.dart';
import 'package:sooqin/logic/controller/ads_controller.dart';

class AdsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdsController());
  }
}
