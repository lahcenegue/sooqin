import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/logic/controller/categories_controller.dart';
import 'package:sooqin/routes/routes.dart';
import 'package:sooqin/view/search_page.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({
    super.key,
  });

  final controller = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('الأقسام'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: GetBuilder<CategoriesController>(
        builder: (_) {
          return Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: Get.height,
                width: Get.width * 0.35,
                color: Colors.grey[300],
                child: ListView.separated(
                  itemCount: controller.categoriesListName.length,
                  separatorBuilder: (context, index) => const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        controller
                            .getSubCat(controller.categoriesListName[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          controller.categoriesListName[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: controller.index ==
                                    controller.categoriesListName.indexOf(
                                        controller.categoriesListName[index])
                                ? Get.width * 0.05
                                : Get.width * 0.04,
                            color: controller.index ==
                                    controller.categoriesListName.indexOf(
                                        controller.categoriesListName[index])
                                ? AppColors.primary
                                : AppColors.secondary,
                            fontWeight: controller.index ==
                                    controller.categoriesListName.indexOf(
                                        controller.categoriesListName[index])
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: Get.height,
                width: Get.width * 0.65,
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: controller.subCategories.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: Get.width * 0.05),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.listAds,
                          arguments: {
                            'title': controller.subCategories[index].name,
                            'id': controller.subCategories[index].id,
                            'index': index,
                          },
                        );
                      },
                      child: Container(
                        height: Get.width * 0.2,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(controller.subCategories[index].name!),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
