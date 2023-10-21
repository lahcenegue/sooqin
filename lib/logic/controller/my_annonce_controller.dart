import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/Data/APIs/my_ads_api.dart';
import 'package:sooqin/models/ads_model.dart';

class MyAnnonceController extends GetxController {
  final box = GetStorage();
  List<AdsModel> myAds = <AdsModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  Future<void> getData() async {
    myAds = await myAdsApi(token: box.read('token'), page: 1);
    isLoading(false);
  }
}
