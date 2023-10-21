import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/ads_api.dart';
import 'package:sooqin/models/ads_model.dart';

class AdsController extends GetxController {
  int? id;
  AdsModel adsModel = AdsModel();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    id = Get.arguments['id'];
    getData();

    super.onInit();
  }

  Future<void> getData() async {
    adsModel = await getAdsData(id: id!);
    isLoading(false);
    update();
  }
}
