import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/widgets/constum_button.dart';
import 'package:sooqin/logic/controller/login_controller.dart';

class LoginMobileView extends StatelessWidget {
  LoginMobileView({super.key});

  final LoginController controller =
      Get.put(LoginController(), permanent: true);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
            ),
            body: Stack(
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        height: Get.height * 0.43,
                        width: Get.width,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: Get.height,
                    width: Get.width,
                    child: Form(
                      key: globalKey,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: Get.height * 0.25,
                          ),
                          Text(
                            'ادخل رقم هاتفك لتسجيل الدخول',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Get.height * 0.03,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.1,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: IntlPhoneField(
                              languageCode: "ar",
                              countries: const <Country>[
                                Country(
                                  name: "Kuwait",
                                  nameTranslations: {
                                    "sk": "Kuvajt",
                                    "se": "Kuwait",
                                    "pl": "Kuwejt",
                                    "no": "Kuwait",
                                    "ja": "クウェート",
                                    "it": "Kuwait",
                                    "zh": "科威特",
                                    "nl": "Koeweit",
                                    "de": "Kuwait",
                                    "fr": "Koweït",
                                    "es": "Kuwait",
                                    "en": "Kuwait",
                                    "pt_BR": "Kuwait",
                                    "sr-Cyrl": "Кувајт",
                                    "sr-Latn": "Kuvajt",
                                    "zh_TW": "科威特",
                                    "tr": "Kuveyt",
                                    "ro": "Kuweit",
                                    "ar": "الكويت",
                                    "fa": "کویت",
                                    "yue": "科威特"
                                  },
                                  flag: "🇰🇼",
                                  code: "KW",
                                  dialCode: "965",
                                  minLength: 8,
                                  maxLength: 8,
                                ),
                              ],
                              textAlign: TextAlign.left,
                              invalidNumberMessage: 'قمت بإدخال رقم خاطئ',
                              onChanged: (value) {
                                controller.phoneNumber = value.number;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(08),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // login button
                          customButton(
                            title: 'ارسل رمز التحقق',
                            topPadding: 40,
                            buttonWidth: Get.width,
                            onPressed: () {
                              controller.loginNumber();
                              if (validateAndSave()) {}
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<LoginController>(builder: (cntx) {
            return Visibility(
              visible: cntx.isApiCallProcess ? true : false,
              child: Stack(
                children: [
                  ModalBarrier(
                    color: Colors.white.withOpacity(0.6),
                    dismissible: true,
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final FormState? form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
