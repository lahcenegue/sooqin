import 'package:get/get.dart';

import 'package:sooqin/Data/APIs/get_ads_api.dart';
import 'package:sooqin/Data/APIs/sub_cat_api.dart';
import 'package:sooqin/models/ads_model.dart';

import 'package:sooqin/models/subcat_model.dart';

class ListAdsController extends GetxController {
  List<AdsModel> listAds = <AdsModel>[].obs;
  SubCatModel subCategories = SubCatModel();
  List<String> subCategoriesListName = <String>[];
  List<int> subCategoriesListId = <int>[];
  //
  int iBrand = 0;
  List<String> subCatListName = <String>[];
  List<int> subCatListId = <int>[];
  //
  int index = 0;
  bool isLoading = false;
  String selectedBrand = 'Brand';
  String secondBrand = '';
  String? title;
  int? id;

  @override
  void onInit() {
    title = Get.arguments['title'];
    id = Get.arguments['id'];
    index = Get.arguments['index'];
    getData();

    super.onInit();
  }

  Future<void> getData() async {
    isLoading = true;
    update();

    List<AdsModel> ads = await getSubCatAds(id: id!, page: 1);
    listAds.addAll(ads);
    subCategories = await getSubCategory(id: id!);

    if (subCategories.subCat == null) {
      subCategoriesListName = [];
    } else {
      for (int i = 0; i < subCategories.subCat!.length; i++) {
        subCategoriesListName.add(subCategories.subCat![i].name!);
        subCategoriesListId.add(subCategories.subCat![i].id!);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> updateBrand(String brand) async {
    selectedBrand = brand;
    subCatListName.clear();
    secondBrand = '';
    iBrand = subCategoriesListName.indexOf(brand);
    for (int i = 0; i < subCategories.subCat![iBrand].subAll!.length; i++) {
      subCatListName.add(subCategories.subCat![iBrand].subAll![i].subName!);
      subCatListId.add(subCategories.subCat![iBrand].subAll![i].subId!);
    }
    update();
    isLoading = true;
    listAds.clear();

    int i = subCategoriesListName.indexOf(brand);
    List<AdsModel> ads =
        await getSubCatAds(id: subCategoriesListId[i], page: 1);

    listAds.addAll(ads);

    isLoading = false;

    update();
  }

  Future<void> updateSubBrand(String sBrand) async {
    secondBrand = sBrand;
    isLoading = true;
    listAds.clear();
    update();
    int i = subCatListName.indexOf(sBrand);
    List<AdsModel> ads = await getSubCatAds(id: subCatListId[i], page: 1);
    listAds.addAll(ads);
    isLoading = false;
    update();
  }
}
