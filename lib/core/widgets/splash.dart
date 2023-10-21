import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon.jpeg',
              width: Get.width * 0.3,
              height: Get.height * 0.3,
            ),
            const SizedBox(height: 25),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
