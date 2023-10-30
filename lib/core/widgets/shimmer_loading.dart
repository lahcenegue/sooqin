import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/utils/app_strings.dart';

class ShimmerLoading extends StatelessWidget {
  final String type;
  const ShimmerLoading({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerlightColor,
      child: type == AppStrings.categoryBox
          ? Column(
              children: [
                Container(
                  width: Get.width * 0.18,
                  height: Get.width * 0.18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Get.width * 0.02),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: Get.width * 0.18,
                  height: Get.width * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            )
          : type == AppStrings.banner
              ? Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                )
              : type == AppStrings.productBox
                  ? Container(
                      width: Get.width * 0.45,
                      height: Get.width * 0.44,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: Get.height * 0.22,
                                width: Get.width * 0.42,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(08),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: Get.height * 0.03,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(08),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: Get.height * 0.03,
                                width: Get.width * 0.20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(08),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
    );
  }
}
