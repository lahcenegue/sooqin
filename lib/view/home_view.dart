import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/utils/app_icons.dart';
import 'package:sooqin/core/widgets/costum_bottom_bar.dart';
import 'package:sooqin/routes/routes.dart';
import 'package:sooqin/view/categories_view.dart';
import 'package:sooqin/view/login_mobile_view.dart';
import 'package:sooqin/view/main_view.dart';
import 'package:sooqin/view/more_view.dart';
import 'package:sooqin/view/my_account.dart';
import 'package:sooqin/view/my_announces.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final box = GetStorage();
  int selectedIndex = 0;
  List pages = [];
  @override
  void initState() {
    pages = [
      MainView(),
      CategoriesView(),
      box.read('token') != null ? MyAnnoncesView() : LoginMobileView(),
      box.read('token') != null ? MyAccountView() : const MoreView(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (box.read('token') == null) {
              Get.toNamed(Routes.loginPhone);
            } else {
              Get.toNamed(Routes.addAds);
            }
          },
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
        selectedIndex: selectedIndex,
        items: [
          CostomNavigationItem(
            icon: AppIcons.home,
            lebel: 'الرئيسية',
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          CostomNavigationItem(
            icon: AppIcons.category,
            lebel: 'الاقسام',
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          CostomNavigationItem(
            icon: AppIcons.announce,
            lebel: 'إعلاناتي',
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          CostomNavigationItem(
            icon: AppIcons.person,
            lebel: 'المزيد',
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: pages[selectedIndex],
      ),
    );
  }
}
