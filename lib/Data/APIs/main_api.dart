import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;

import 'package:sooqin/models/main_model.dart';

Future<MainModel> getMainDataApi() async {
  MainModel? mainModel;
  try {
    Uri url = Uri.parse('${AppLinks.mainLink}/${AppLinks.mainPrefix}');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      mainModel = MainModel.fromJson(data);

      return mainModel;
    }
  } catch (e) {
    throw Exception(e);
  }

  return mainModel!;
}
