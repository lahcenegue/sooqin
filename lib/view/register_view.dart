import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/logic/controller/register_controller.dart';
import '../core/widgets/constum_button.dart';
import '../core/widgets/text_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    super.key,
  });

  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            height: heightScreen,
            width: widthScreen,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: heightScreen * 0.43,
                  width: widthScreen,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: widthScreen,
              height: heightScreen,
              child: ListView(
                children: [
                  SizedBox(height: heightScreen * 0.23),
                  Text(
                    'انشاء حساب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: heightScreen * 0.03,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: heightScreen * 0.06),
                  customTextFormField(
                    onChanged: (value) {
                      registerController.writeInfo('name', value);
                    },
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.person,
                    hintText: 'الاسم',
                  ),

                  //email
                  customTextFormField(
                    onChanged: (value) {
                      registerController.writeInfo('email', value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.mail,
                    hintText: 'الايميل',
                  ),

                  // login button
                  customButton(
                    title: 'انشاء حساب',
                    topPadding: 40,
                    buttonWidth: widthScreen,
                    onPressed: () {
                      registerController.register();
                    },
                  ),
                  SizedBox(height: heightScreen * 0.1),
                ],
              ),
            ),
          ),
          GetBuilder<RegisterController>(
            builder: (context) {
              return Visibility(
                visible: registerController.isLoading ? true : false,
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
      )),
    );
  }
}
