import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;

import 'package:sooqin/models/ads_model.dart';
import 'package:sooqin/routes/routes.dart';

Future<List<AdsModel>> myAdsApi(
    {required String token, required int page}) async {
  try {
    Uri url =
        Uri.parse('${AppLinks.mainLink}/${AppLinks.myAds}/$page?token=$token');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic data = convert.jsonDecode(response.body);
      Iterable list = data;

      List<AdsModel> subCatAds = list.map((e) => AdsModel.fromJson(e)).toList();

      return subCatAds;
    }
  } catch (e) {
    var box = GetStorage();
    box.erase();
    Get.offAllNamed(Routes.loginPhone);
    throw Exception(e);
  }

  return [];
}
