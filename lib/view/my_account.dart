import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/logic/controller/my_account_controller.dart';
import 'package:sooqin/routes/routes.dart';
import '../core/utils/app_colors.dart';
import '../core/widgets/costtum_card.dart';

class MyAccountView extends StatelessWidget {
  MyAccountView({
    super.key,
  });

  final myAccountController = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.3,
                  padding: const EdgeInsets.only(right: 18),
                  color: AppColors.primary,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.editProfile);
                    },
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.08),
                        Row(
                          children: [
                            Container(
                              height: Get.height * 0.08,
                              width: Get.height * 0.08,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              children: [
                                Text(
                                  myAccountController.profilData.info!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height * 0.03,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                Text(
                                  myAccountController.profilData.phone!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.6,
                  width: Get.width,
                ),
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.19,
            child: Container(
              height: Get.height * 0.6,
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 05,
              ),
              child: ListView(
                children: [
                  // notification
                  Container(
                    height: Get.width * 0.17,
                    margin: EdgeInsets.symmetric(vertical: Get.width * 0.02),
                    padding: EdgeInsets.only(left: 1, right: Get.width * 0.015),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(08),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Obx(
                      () {
                        return Center(
                          child: SwitchListTile(
                            title: Text(
                              'الاشعارات',
                              style: TextStyle(
                                fontSize: Get.width * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            secondary: Icon(
                              Icons.notifications_active,
                              color: AppColors.primary,
                              size: Get.width * 0.08,
                            ),
                            value: myAccountController.isPermission.value,
                            onChanged: (value) async {
                              myAccountController.changePermission();
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // favorite
                  custtomCard(
                    icon: Icons.favorite,
                    title: 'المفضلة',
                    onTap: () {
                      Get.toNamed(Routes.favoritePage);
                    },
                  ),
                  //help
                  custtomCard(
                    icon: Icons.help,
                    title: 'المساعدة',
                    onTap: () {
                      Get.toNamed(Routes.help);
                    },
                  ),
                  //log out
                  custtomCard(
                    icon: Icons.logout_rounded,
                    title: 'تسجيل الخروج',
                    onTap: () async {
                      myAccountController.logOut();
                    },
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<MyAccountController>(builder: (ctnx) {
            return Visibility(
              visible: ctnx.isLoading.value ? true : false,
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
}
