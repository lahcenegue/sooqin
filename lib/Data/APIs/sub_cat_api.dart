import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;
import 'package:sooqin/models/subcat_model.dart';

Future<SubCatModel> getSubCategory({required int id}) async {
  SubCatModel subCategoryModel = SubCatModel();
  try {
    Uri url =
        Uri.parse('${AppLinks.mainLink}/${AppLinks.subCatProfix}/$id/all');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      subCategoryModel = SubCatModel.fromJson(data);

      return subCategoryModel;
    }
  } catch (e) {
    throw Exception(e);
  }

  return subCategoryModel;
}
