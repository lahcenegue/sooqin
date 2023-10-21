import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/Data/APIs/api_login_code.dart';
import 'package:sooqin/Data/APIs/api_login_mobile.dart';
import 'package:sooqin/core/utils/app_strings.dart';
import 'package:sooqin/routes/routes.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  bool isApiCallProcess = false;
  String phoneNumber = '';
  String yourCode = '';

  void loginNumber() async {
    if (phoneNumber.isEmpty || phoneNumber.length < 8) {
      Get.defaultDialog(
        title: AppStrings.appName,
        textCancel: 'رجوع',
        content: const Text(
          'يجب ادخال الرقم الصحيح',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      try {
        isApiCallProcess = true;
        update();
        await apiLoginMobile(phoneNumber);
      } finally {
        isApiCallProcess = false;
        Get.offAllNamed(Routes.loginCode);
      }
    }

    update();
  }

  void loginCode() async {
    update();
    if (yourCode.isEmpty || yourCode.length < 4) {
      Get.defaultDialog(
        title: AppStrings.appName,
        textCancel: 'رجوع',
        content: const Text(
          'يجب ادخال الرمز الصحيح',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      isApiCallProcess = true;
      update();
      await apiLoginCode(phoneNumber, yourCode).then(
        (value) async {
          isApiCallProcess = false;
          if (value.code == null) {
            if (value.user == "new") {
              //Get.off(RegisterScreen);
            } else if (value.user == "old") {
              box.write('phone', phoneNumber);
              box.write('token', value.token);
              box.write('name', value.name);
              Get.offNamed(Routes.homeScreen);
            } else if (value.code == 'error') {
              Get.defaultDialog(
                title: AppStrings.appName,
                textConfirm: 'رجوع',
                content: const Text(
                  'يجب ادخال الكود الصحيح',
                  textAlign: TextAlign.center,
                ),
              );
            }
          }
        },
      );
    }
  }
}
