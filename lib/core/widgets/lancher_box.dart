import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget lancherBox({
  required Function() onTap,
  required IconData icon,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: Get.width * 0.12,
      width: Get.width * 0.12,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(Get.width * 0.1),
      ),
      child: Center(
        child: Icon(
          icon,
          size: Get.width * 0.06,
          color: Colors.white,
        ),
      ),
    ),
  );
}
