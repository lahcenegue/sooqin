import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;
import 'package:sooqin/models/ads_model.dart';

Future<List<AdsModel>> apiSearch({required String query}) async {
  try {
    var url = Uri.parse("${AppLinks.mainLink}/${AppLinks.search}=$query");

    http.Response response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      Iterable list = data;

      List<AdsModel> adsModel = list.map((e) => AdsModel.fromJson(e)).toList();

      return adsModel;
    }
  } catch (e) {
    throw Exception(e);
  }
  return [];
}
