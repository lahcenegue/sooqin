import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/categories_api.dart';
import 'package:sooqin/models/categories_model.dart';

class CategoriesController extends GetxController {
  List<CategoriesModel>? categories = [];
  List<String> categoriesList = <String>[];
  List<SubCat> subCategoriesList = <SubCat>[];
  RxBool isLoading = true.obs;

  int index = 0;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getIndex(indx) {
    index = indx;
    update();
  }

  Future getData() async {
    categories = await getCategoriesInfo();
    for (int i = 0; i < categories!.length; i++) {
      categoriesList.add(categories![i].name!);
    }
    for (int i = 0; i < categories![index].subCat!.length; i++) {
      subCategoriesList.add(categories![index].subCat![i]);
    }
  }

  void getSubCat(String categeryName) {
    index = categoriesList.indexOf(categeryName);
    subCategoriesList.clear();
    for (int i = 0; i < categories![index].subCat!.length; i++) {
      subCategoriesList.add(categories![index].subCat![i]);
    }

    update();
  }
}
