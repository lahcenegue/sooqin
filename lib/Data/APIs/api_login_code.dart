import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'package:sooqin/logic/controller/one_signal_controller.dart';
import 'dart:convert' as convert;

import 'package:sooqin/models/login_code_model.dart';

Future<LoginCodeModel> apiLoginCode(String phone, yourCode) async {
  try {
    var url = Uri.parse(
        "${AppLinks.mainLink}/${AppLinks.login}/${OneSignalControler.osUserID}/$phone/$yourCode");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var body = convert.jsonDecode(response.body);

      LoginCodeModel loginCodeModel = LoginCodeModel.fromJson(body);

      return loginCodeModel;
    }
  } catch (e) {
    throw Exception(e);
  }
  return LoginCodeModel();
}
