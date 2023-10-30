import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/widgets/icon_piker.dart';

Widget categoriesBox({
  required String name,
  String? image,
}) {
  return Column(
    children: [
      Container(
        width: Get.width * 0.18,
        height: Get.width * 0.18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              iconPiker(name).toString(),
            ),
          ),
          borderRadius: BorderRadius.circular(Get.width * 0.02),
        ),
      ),
      Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: Get.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}
