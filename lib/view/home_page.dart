import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/controller/home_controller.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/utils/app_icons.dart';
import 'package:sooqin/core/widgets/costum_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List pages = const [
    Text('1'),
    Text('2'),
    Text('3'),
    Text('4'),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeContorller>(
        init: HomeContorller(),
        builder: (controller) {
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
              body: Center(
                child: pages[controller.selectedIndex],
              ));
        });
  }
}
