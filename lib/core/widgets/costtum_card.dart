import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';

Widget custtomCard({
  required IconData icon,
  required String title,
  required Function() onTap,
}) {
  return Builder(
    builder: (BuildContext context) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: Get.width * 0.16,
          margin: EdgeInsets.symmetric(vertical: Get.width * 0.02),
          padding:
              EdgeInsets.only(left: Get.width * 0.2, right: Get.width * 0.06),
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
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: Get.width * 0.08,
              ),
              SizedBox(width: Get.width * 0.05),
              Text(
                title,
                style: TextStyle(
                  fontSize: Get.width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );
}
