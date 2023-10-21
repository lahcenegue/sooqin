import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/logic/controller/login_controller.dart';
import '../core/widgets/constum_button.dart';

class LoginCodeView extends StatelessWidget {
  LoginCodeView({
    super.key,
  });
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: Get.height * 0.8,
              width: Get.width,
              child: ListView(
                children: [
                  SizedBox(
                    height: Get.height * 0.27,
                  ),
                  Text(
                    'رمز التحقق',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * 0.03,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: Get.width * 0.02),
                  Text(
                    'ادخل الارقام التي ارسلت الى رقم هاتفك',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * 0.02,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.11,
                    padding: EdgeInsets.all(Get.width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'رمز التحقق ارسل الى الرقم',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height * 0.02,
                              ),
                            ),
                            Text(
                              controller.phoneNumber,
                              style: TextStyle(
                                fontSize: Get.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.mode,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      length: 4,
                      onChanged: (value) {
                        controller.yourCode = value;
                      },
                    ),
                  ),

                  // login button
                  customButton(
                    title: 'تأكيد',
                    buttonWidth: Get.width,
                    topPadding: 40,
                    onPressed: () {
                      controller.loginCode();
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.12,
                  ),
                ],
              ),
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
      )),
    );
  }
}
