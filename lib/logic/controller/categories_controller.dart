import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/categories_api.dart';
import 'package:sooqin/Data/APIs/sub_cat_api.dart';
import 'package:sooqin/models/categories_model.dart';
import 'package:sooqin/models/subcat_model.dart';

class CategoriesController extends GetxController {
  //Categories
  List<CategoriesModel>? categories = [];
  List<String> categoriesListName = <String>[];
  List<int> categoriesListId = <int>[];
  // SubCategories
  List<SubCat> subCategories = <SubCat>[];
  List<String> subCatListName = <String>[];
  List<int> subCatListId = <int>[];
  //SubCat3
  SubCatModel subCatModel = SubCatModel();
  List<String> subCat3Name = <String>[];
  List<int> subCat3Id = <int>[];
  List<List<SubAll>> subCat3All = <List<SubAll>>[];

  //SubCat4
  List<String> subCat4Name = <String>[];
  List<int> subCat4Id = <int>[];

  bool isLoading = false;

  int index = 0;

  int? catId1;
  int? catId2;
  int? catId3;
  int? catId4;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getIndex(indx) {
    index = indx;
    subCategories.clear();
    for (int i = 0; i < categories![index].subCat!.length; i++) {
      subCategories.add(categories![index].subCat![i]);
      subCatListName.add(categories![index].subCat![i].name!);
      subCatListId.add(categories![index].subCat![i].id!);
    }
    update();
  }

  Future getData() async {
    categories = await getCategoriesInfo();
    for (int i = 0; i < categories!.length; i++) {
      categoriesListName.add(categories![i].name!);
      categoriesListId.add(categories![i].id!);
    }
    subCategories.clear();
    for (int i = 0; i < categories![index].subCat!.length; i++) {
      subCategories.add(categories![index].subCat![i]);
      subCatListName.add(categories![index].subCat![i].name!);
      subCatListId.add(categories![index].subCat![i].id!);
    }
  }

  void getSubCat(String categeryName) {
    index = categoriesListName.indexOf(categeryName);
    subCategories.clear();
    for (int i = 0; i < categories![index].subCat!.length; i++) {
      subCategories.add(categories![index].subCat![i]);
      subCatListName.add(categories![index].subCat![i].name!);
      subCatListId.add(categories![index].subCat![i].id!);
    }

    update();
  }

//
  void getCatID1(String name) {
    index = categoriesListName.indexOf(name);
    catId1 = categoriesListId[index];

    if (catId2 != null) {
      catId2 = null;
      catId3 = null;
      catId4 = null;
    }

    subCategories.clear();
    subCatListName.clear();
    subCatListId.clear();
    update();

    for (int i = 0; i < categories![index].subCat!.length; i++) {
      subCategories.add(categories![index].subCat![i]);
      subCatListName.add(categories![index].subCat![i].name!);
      subCatListId.add(categories![index].subCat![i].id!);
    }
    update();
  }

  Future<void> getCatID2(String name) async {
    index = subCatListName.indexOf(name);
    catId2 = subCatListId[index];
    subCat3Name.clear();
    subCat3Id.clear();
    subCat3All.clear();
    if (catId3 != null) {
      catId3 = null;
      catId4 = null;
    }

    isLoading = true;
    update();

    subCatModel = await getSubCategory(id: catId2!);
    if (subCatModel.subCat != null) {
      for (int i = 0; i < subCatModel.subCat!.length; i++) {
        subCat3Name.add(subCatModel.subCat![i].name!);
        subCat3Id.add(subCatModel.subCat![i].id!);
        subCat3All.add(subCatModel.subCat![i].subAll!);
      }
    } else {}

    isLoading = false;
    update();
  }

  void getCatID3(String name) {
    index = subCat3Name.indexOf(name);
    catId3 = subCat3Id[index];
    subCat4Name.clear();
    subCat4Id.clear();
    if (catId4 != null) {
      catId4 = null;
    }

    update();

    for (int i = 0; i < subCat3All[index].length; i++) {
      subCat4Name.add(subCat3All[index][i].subName!);
      subCat4Id.add(subCat3All[index][i].subId!);
    }
  }

  void getCatID4(String name) {
    index = subCat4Name.indexOf(name);
    catId4 = subCat4Id[index];

    update();
  }
}
