import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final List<CostomNavigationItem>? items;
  CustomBottomBar({
    super.key,
    required this.selectedIndex,
    this.items,
  });

  final double iconSize = Get.width * 0.05;
  final double labelSize = Get.width * 0.04;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 04),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1st
          SizedBox(
            width: widthScreen * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: items![0].onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 08,
                      horizontal: 03,
                    ),
                    width: selectedIndex == 0
                        ? widthScreen * 0.22
                        : widthScreen * 0.15,
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? AppColors.primary.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          items![0].icon,
                          color: selectedIndex == 0
                              ? AppColors.primary
                              : Colors.black,
                          width: iconSize,
                        ),
                        Visibility(
                          visible: selectedIndex == 0 ? true : false,
                          child: Text(
                            items![0].lebel,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: labelSize,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //الاقسام
                InkWell(
                  onTap: items![1].onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 08, horizontal: 03),
                    width: selectedIndex == 1
                        ? widthScreen * 0.22
                        : widthScreen * 0.15,
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? AppColors.primary.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          items![1].icon,
                          color: selectedIndex == 1
                              ? AppColors.primary
                              : Colors.black,
                          width: iconSize,
                        ),
                        Visibility(
                          visible: selectedIndex == 1 ? true : false,
                          child: Text(
                            items![1].lebel,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: labelSize,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // space
          SizedBox(width: widthScreen * 0.15),

          //اعلاناتي
          //2 rd
          SizedBox(
            width: widthScreen * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: items![2].onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 08, horizontal: 03),
                    width: selectedIndex == 2
                        ? widthScreen * 0.22
                        : widthScreen * 0.15,
                    decoration: BoxDecoration(
                      color: selectedIndex == 2
                          ? AppColors.primary.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          items![2].icon,
                          color: selectedIndex == 2
                              ? AppColors.primary
                              : Colors.black,
                          width: iconSize,
                        ),
                        Visibility(
                          visible: selectedIndex == 2 ? true : false,
                          child: Text(
                            items![2].lebel,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: labelSize,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //المزيد
                InkWell(
                  onTap: items![3].onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 08, horizontal: 03),
                    width: selectedIndex == 3
                        ? widthScreen * 0.22
                        : widthScreen * 0.15,
                    decoration: BoxDecoration(
                      color: selectedIndex == 3
                          ? AppColors.primary.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          items![3].icon,
                          color: selectedIndex == 3
                              ? AppColors.primary
                              : Colors.black,
                          width: iconSize,
                        ),
                        Visibility(
                          visible: selectedIndex == 3 ? true : false,
                          child: Text(
                            items![3].lebel,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: labelSize,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CostomNavigationItem {
  final String icon;
  final Function() onTap;
  final String lebel;
  const CostomNavigationItem({
    required this.icon,
    required this.onTap,
    required this.lebel,
  });
}
