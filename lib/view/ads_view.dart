import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/utils/app_strings.dart';
import 'package:sooqin/core/widgets/button_favorite.dart';
import 'package:sooqin/core/widgets/image_slider.dart';
import 'package:sooqin/core/widgets/lancher_box.dart';
import 'package:sooqin/logic/controller/ads_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/utils/app_links.dart';

class AdsView extends StatelessWidget {
  AdsView({super.key});

  final controller = Get.find<AdsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsController>(
      builder: (context) {
        if (controller.isLoading.value == true) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              width: Get.width,
              height: Get.height * 0.09,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Container(
                    height: Get.width * 0.12,
                    width: Get.width * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 08),
                  Text(
                    controller.adsModel.user!.name!,

                    //hvm.adsData!.userName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.width * 0.018,
                    ),
                  ),
                  const Spacer(),
                  lancherBox(
                    icon: Icons.phone,
                    width: Get.width,
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: controller.adsModel.user!.mobile!,
                      );
                      await launchUrl(launchUri);
                    },
                  ),
                  const SizedBox(width: 05),
                  lancherBox(
                    icon: Icons.message,
                    width: Get.width,
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'sms',
                        path: controller.adsModel.user!.mobile!,
                        queryParameters: <String, String>{
                          'body': Uri.encodeComponent(
                              '${controller.adsModel.title}'),
                        },
                      );
                      await launchUrl(launchUri);
                    },
                  ),
                  const SizedBox(width: 05),
                  lancherBox(
                    icon: Icons.perm_phone_msg,
                    width: Get.width,
                    onTap: () async {
                      final Uri whatsapp = Uri.parse(
                          'https://wa.me/${controller.adsModel.user!.mobile!}');
                      launchUrl(whatsapp);
                    },
                  ),
                ],
              ),
            ),
            body: ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.4,
                  child: Stack(
                    children: [
                      ImagesSlider(
                        urlImages: controller.adsModel.images!,
                        height: Get.height * 0.4,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          width: Get.width,
                          color: Colors.grey.withOpacity(0.6),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: Get.width * 0.08,
                                  )),
                              const Spacer(),
                              ButtonFavorite(
                                size: Get.width * 0.08,
                                id: controller.adsModel.id,
                                title: controller.adsModel.title,
                                image: controller.adsModel.images![0],
                                created: controller.adsModel.created,
                                price: controller.adsModel.price,
                                desc: controller.adsModel.desc,
                                userId: controller.adsModel.userId,
                              ),
                              SizedBox(width: Get.width * 0.01),
                              IconButton(
                                onPressed: () {
                                  Share.share(
                                    '${controller.adsModel.title} \n ${controller.adsModel.desc} \n ${AppLinks.mainLink}/play/${controller.adsModel.id}',
                                  );
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: Get.width * 0.08,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('06/09/2023'),
                          Text(
                            controller.adsModel.price! == 'None'
                                ? controller.adsModel.price!
                                : '${controller.adsModel.price!} ${AppStrings.currency}',
                            style: TextStyle(
                              fontSize: Get.width * 0.05,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.width * 0.02),
                      Text(
                        controller.adsModel.title!,
                        style: TextStyle(
                          fontSize: Get.width * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: Get.width * 0.04),
                      Text(
                        controller.adsModel.desc!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: Get.width * 0.04,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: Get.width * 0.02),
                      Text(
                        'تفاصيل',
                        style: TextStyle(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: Get.width * 0.01),
                      ListView.builder(
                        padding: const EdgeInsets.all(20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.adsModel.details!.length,
                        itemBuilder: (context, index) {
                          return Text(controller.adsModel.details![index]);
                        },
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
