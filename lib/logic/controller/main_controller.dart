import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/main_api.dart';
import 'package:sooqin/models/main_model.dart';

class MainContorller extends GetxController {
  //
  MainModel main = MainModel();
  //

  RxList<String> banner = <String>[].obs;
  RxList<AdsModels> ads = <AdsModels>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    //index = Get.arguments['index'] ?? 0;
    getData().whenComplete(() => getMainData());
    super.onInit();
  }

  Future getData() async {
    main = await getMainDataApi();
  }

  void getMainData() {
    DateTime time = DateTime.now();

    try {
      for (int i = 0; i < main.banners!.length; i++) {
        banner.add(main.banners![i].image!);
      }
      ads.addAll(main.ads!);
    } finally {
      isLoading(false);
      DateTime time2 = DateTime.now();
      var resultSconde = time2.second - time.second;
      var resultmili = time2.millisecond - time.millisecond;
      print('=========================================');
      print('result:  $resultSconde : $resultmili');
      print('=========================================');
    }
  }

  //
}
