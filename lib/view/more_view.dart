import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/widgets/costtum_card.dart';
import 'package:sooqin/routes/routes.dart';
import '../core/utils/app_colors.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

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
                  //log in
                  custtomCard(
                    widthScreen: Get.width,
                    icon: Icons.login,
                    title: 'تسجيل الدخول',
                    onTap: () {
                      Get.toNamed(Routes.loginPhone);
                    },
                  ),
                  // notification
                  custtomCard(
                    widthScreen: Get.width,
                    icon: Icons.notifications,
                    title: 'تفعيل الاشعارات',
                    onTap: () {},
                  ),
                  // favorite
                  custtomCard(
                    widthScreen: Get.width,
                    icon: Icons.favorite,
                    title: 'المفضلة',
                    onTap: () {
                      Get.toNamed(Routes.favoritePage);
                    },
                  ),
                  //help
                  custtomCard(
                    widthScreen: Get.width,
                    icon: Icons.help,
                    title: 'المساعدة',
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const HelpScreen(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
