import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;

import 'package:sooqin/models/categories_model.dart';

Future<List<CategoriesModel>> getCategoriesInfo() async {
  try {
    Uri url = Uri.parse('${AppLinks.mainLink}/${AppLinks.categoriesPrefix}');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      Iterable list = data;

      List<CategoriesModel> categoriesModel =
          list.map((e) => CategoriesModel.fromJson(e)).toList();

      return categoriesModel;
    }
  } catch (e) {
    throw Exception(e);
  }

  return [];
}
