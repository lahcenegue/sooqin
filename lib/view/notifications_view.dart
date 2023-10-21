import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/logic/controller/notification_controller.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final controller = Get.find<NotificationController>();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: Get.height * 0.3,
                    width: Get.width,
                    color: AppColors.primary,
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.04),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: Get.height * 0.04,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'الاشعارات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Get.height * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.7,
                    width: Get.width,
                  ),
                ],
              ),
              Positioned(
                top: Get.height * 0.25,
                child: SizedBox(
                  height: Get.height * 0.75,
                  width: Get.width,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.listNotifications.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 08),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.listNotifications[index].title
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: Get.height * 0.022,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 08),
                                Text(
                                  controller.listNotifications[index].comment
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: Get.height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              controller.listNotifications[index].time
                                  .toString(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
