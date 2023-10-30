import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/widgets/email_validator.dart';
import 'package:sooqin/core/widgets/text_form.dart';
import 'package:sooqin/logic/controller/my_account_controller.dart';
import '../core/widgets/constum_button.dart';

class EditProfilScreen extends StatelessWidget {
  EditProfilScreen({super.key});

  final box = GetStorage();
  final controller = Get.find<MyAccountController>();

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: Get.height * 0.04,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        Center(
                          child: Container(
                            height: Get.height * 0.12,
                            width: Get.height * 0.12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.015),
                        Center(
                          child: Text(
                            controller.profilData.info!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Get.height * 0.025,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Get.height * 0.33,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                child: Column(
                  children: [
                    customTextFormField(
                      onChanged: (value) {
                        controller.writeInfo('info', value);
                      },
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.info,
                      hintText: controller.profilData.info!.isEmpty
                          ? 'المعلومات'
                          : controller.profilData.info!,
                    ),

                    //email
                    customTextFormField(
                      onChanged: (value) {
                        controller.writeInfo('email', value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.mail,
                      hintText: controller.profilData.email!.isEmpty
                          ? 'الايميل'
                          : controller.profilData.email!,
                    ),
                    customButton(
                      title: 'تأكيد',
                      topPadding: 40,
                      buttonWidth: Get.width,
                      onPressed: () async {
                        controller.editProfile();
                      },
                    ),
                    SizedBox(height: Get.height * 0.1),
                  ],
                ),
              ),
            ),
            GetBuilder<MyAccountController>(
              builder: (cntx) {
                return Visibility(
                  visible: cntx.isLoading.value ? true : false,
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
