import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('المساعدة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.25,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(
                child: Text('Same illustration'),
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            Container(
              padding: const EdgeInsets.all(12),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.email_rounded,
                    size: Get.height * 0.05,
                    color: Colors.white,
                  ),
                  Text(
                    'ارسل بريد الكتروني',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.height * 0.025,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    'support@sooq.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.height * 0.022,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.025),
            Container(
              padding: const EdgeInsets.all(12),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.phone,
                    size: Get.height * 0.05,
                    color: Colors.white,
                  ),
                  Text(
                    'اتصل بنا',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.height * 0.025,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    '00965 555 555 555',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.height * 0.022,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
