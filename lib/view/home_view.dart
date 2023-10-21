import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/widgets/splash.dart';
import 'package:sooqin/logic/controller/home_controller.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/utils/app_icons.dart';
import 'package:sooqin/core/widgets/costum_bottom_bar.dart';
import 'package:sooqin/logic/controller/main_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeContorller());
  final maincontroller = Get.find<MainContorller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeContorller>(builder: (controller) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(03),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              )),
          bottomNavigationBar: CustomBottomBar(
            selectedIndex: controller.selectedIndex,
            items: [
              CostomNavigationItem(
                icon: AppIcons.home,
                lebel: 'الرئيسية',
                onTap: () {
                  controller.selectPage(0);
                },
              ),
              CostomNavigationItem(
                icon: AppIcons.category,
                lebel: 'الاقسام',
                onTap: () {
                  controller.selectPage(1);
                },
              ),
              CostomNavigationItem(
                icon: AppIcons.announce,
                lebel: 'إعلاناتي',
                onTap: () {
                  controller.selectPage(2);
                },
              ),
              CostomNavigationItem(
                icon: AppIcons.person,
                lebel: 'المزيد',
                onTap: () {
                  controller.selectPage(3);
                },
              ),
            ],
          ),
          body: Obx(() {
            if (maincontroller.isLoading.isTrue) {
              return const SplashScreen();
            } else {
              return Center(
                child: controller.pages[controller.selectedIndex],
              );
            }
          }));
    });
  }
}
