import 'package:http/http.dart' as http;
import 'package:sooqin/core/utils/app_links.dart';
import 'dart:convert' as convert;

import 'package:sooqin/models/notification_model.dart';

Future<List<NotificationModel>> getNotificationApi(
    {String? token, required int page}) async {
  try {
    Uri url;
    if (token != null) {
      url = Uri.parse(
          "${AppLinks.mainLink}/${AppLinks.notification}/$page?token=$token");
    } else {
      url = Uri.parse("${AppLinks.mainLink}/${AppLinks.notification}/$page");
    }

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      Iterable list = data;

      List<NotificationModel> notificationModel =
          list.map((e) => NotificationModel.fromJson(e)).toList();

      return notificationModel;
    }
  } catch (e) {
    throw Exception(e);
  }
  return [];
}
