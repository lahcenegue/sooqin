import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/Data/APIs/api_register.dart';
import 'package:sooqin/core/utils/app_strings.dart';
import 'package:sooqin/logic/controller/login_controller.dart';
import 'package:sooqin/models/register_response_model.dart';
import 'package:sooqin/routes/routes.dart';

class RegisterController extends GetxController {
  final box = GetStorage();
  bool isLoading = false;
  final loginController = Get.find<LoginController>();
  RegisterRequestModel registerRequestModel = RegisterRequestModel();

  void writeInfo(String id, String value) {
    switch (id) {
      case 'name':
        {
          if (value.isEmpty) {
            Get.defaultDialog(
              title: AppStrings.appName,
              textCancel: 'رجوع',
              content: const Text(
                'يجب ادخال الاسم الصحيح',
                textAlign: TextAlign.center,
              ),
            );
          } else {
            registerRequestModel.name = value;
            update();
          }
        }
        break;

      case 'email':
        {
          if (value.isEmpty) {
            Get.defaultDialog(
              title: AppStrings.appName,
              textCancel: 'رجوع',
              content: const Text(
                'يجب ادخال الاميل الصحيح',
                textAlign: TextAlign.center,
              ),
            );
          } else {
            registerRequestModel.email = value;
            update();
          }
        }
        break;
    }
  }

  Future<void> register() async {
    if (registerRequestModel.name == null) {
      Get.defaultDialog(
        title: AppStrings.appName,
        textCancel: 'رجوع',
        content: const Text(
          'يجب كتابة الاسم الصحيح',
          textAlign: TextAlign.center,
        ),
      );
    } else if (registerRequestModel.email == null ||
        !registerRequestModel.email!.contains(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      Get.defaultDialog(
        title: AppStrings.appName,
        textCancel: 'رجوع',
        content: const Text(
          'يجب كتابة الاميل الصحيح',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      isLoading = true;
      update();
      await apiRegister(
        phone: loginController.phoneNumber,
        yourCode: loginController.yourCode,
        registerRequestModel: registerRequestModel,
      ).then(
        (value) {
          isLoading = false;
          update();
          if (value.msg == "ok") {
            box.write('phone', loginController.phoneNumber);
            box.write('token', value.token);
            box.write('name', value.name);
            Get.offNamed(Routes.splash);
          }
        },
      );
    }
  }
}
