import 'package:get/get.dart';
import 'package:sooqin/logic/controller/add_ads_controller.dart';

class AddAdsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddAdsController());
  }
}
