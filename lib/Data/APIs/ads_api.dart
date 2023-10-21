import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;

import 'package:sooqin/models/ads_model.dart';

Future<AdsModel> getAdsData({required int id}) async {
  AdsModel? adsModel;
  try {
    Uri url = Uri.parse('${AppLinks.mainLink}/${AppLinks.adsPrefix}/$id');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      adsModel = AdsModel.fromJson(data[0]);

      return adsModel;
    }
  } catch (e) {
    throw Exception(e);
  }

  return adsModel!;
}
