import 'package:get/get.dart';
import 'package:sooqin/logic/controller/listads_controller.dart';

class ListAdsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListAdsController());
  }
}
