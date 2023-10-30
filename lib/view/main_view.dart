import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/utils/app_strings.dart';
import 'package:sooqin/core/widgets/categories_box.dart';
import 'package:sooqin/core/widgets/image_slider.dart';
import 'package:sooqin/core/widgets/product_box.dart';
import 'package:sooqin/core/widgets/shimmer_loading.dart';
import 'package:sooqin/logic/controller/categories_controller.dart';
import 'package:sooqin/logic/controller/main_controller.dart';
import 'package:sooqin/logic/controller/notification_controller.dart';
import 'package:sooqin/routes/routes.dart';
import 'package:sooqin/view/search_page.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final mainController = Get.put(MainContorller());
  final categoriesController = Get.put(CategoriesController());
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        actions: [
          Obx(() {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    notificationController.openNotification();
                    Get.toNamed(Routes.notificationPage);
                  },
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
                Visibility(
                  visible: !notificationController.isOpen.value,
                  child: Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
      body: GetBuilder<MainContorller>(
        builder: (controller) {
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  mainController.banner.isEmpty
                      ? const ShimmerLoading(
                          type: AppStrings.banner,
                        )
                      : ImagesSlider(
                          urlImages: mainController.banner,
                        ),

                  // Categories
                  Container(
                    padding: const EdgeInsets.only(right: 12, top: 30),
                    height: Get.height * 0.3,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesController.categoriesListName.isEmpty
                          ? 12
                          : categoriesController.categoriesListName.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (categoriesController.categoriesListName.isEmpty) {
                          return const ShimmerLoading(
                              type: AppStrings.categoryBox);
                        } else {
                          return GestureDetector(
                            onTap: () {
                              categoriesController.getIndex(index);
                              Get.toNamed(
                                Routes.categoories,
                              );
                            },
                            child: categoriesBox(
                              name: categoriesController
                                  .categoriesListName[index],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    child: const Text(
                      'اخر الاعلانات',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    child: MasonryGridView.builder(
                      physics: const BouncingScrollPhysics(),
                      mainAxisSpacing: Get.width * 0.05,
                      crossAxisSpacing: Get.width * 0.04,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: mainController.ads.isEmpty
                          ? 8
                          : mainController.ads.length,
                      itemBuilder: (context, index) {
                        if (mainController.ads.isEmpty) {
                          return const ShimmerLoading(
                              type: AppStrings.productBox);
                        } else {
                          return productBox(
                            id: mainController.ads[index].id!,
                            image: mainController.ads[index].image!,
                            title: mainController.ads[index].title!,
                            desc: mainController.ads[index].desc!,
                            price: mainController.ads[index].price!,
                            created: mainController.ads[index].created!,
                            userId: mainController.ads[index].userId!,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
