import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/main_api.dart';
import 'package:sooqin/models/main_model.dart';

class MainContorller extends GetxController {
  //
  MainModel main = MainModel();
  //

  List<String> banner = <String>[];
  List<AdsModels> ads = <AdsModels>[];

  bool isLoading = true;

  @override
  void onInit() {
    getData().whenComplete(() => getMainData());
    super.onInit();
  }

  Future getData() async {
    main = await getMainDataApi();
  }

  void getMainData() {
    for (int i = 0; i < main.banners!.length; i++) {
      banner.add(main.banners![i].image!);
    }
    ads.addAll(main.ads!);
    isLoading = false;
    update();
  }

  //
}
