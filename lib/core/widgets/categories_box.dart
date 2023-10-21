import 'package:flutter/material.dart';
import 'package:sooqin/core/widgets/icon_piker.dart';

Widget categoriesBox({
  required String name,
  required double? widthScreen,
  String? image,
}) {
  return Column(
    children: [
      Container(
        width: widthScreen! * 0.18,
        height: widthScreen * 0.18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(iconPiker(name).toString())),
          borderRadius: BorderRadius.circular(widthScreen * 0.02),
        ),
      ),
      Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: widthScreen * 0.04,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}
