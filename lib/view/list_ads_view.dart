import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_colors.dart';
import 'package:sooqin/core/widgets/product_box.dart';
import 'package:sooqin/logic/controller/listads_controller.dart';
import 'package:sooqin/view/search_page.dart';

class ListAdsView extends StatelessWidget {
  ListAdsView({
    super.key,
  });

  final ListAdsController controller = Get.find<ListAdsController>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title!),
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
        bottom: PreferredSize(
          preferredSize: Size(Get.width, Get.width * 0.10),
          child: SizedBox(
            height: Get.width * 0.12,
            child: Row(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5),
                    Icon(
                      Icons.tune,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: Get.width * 0.01),
                    const Text(
                      'فلاتر',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                ),

                //Brand filtre
                SizedBox(
                  height: Get.width * 0.09,
                  width: Get.width * 0.3,
                  child: GetBuilder<ListAdsController>(
                    builder: (context) {
                      return DropdownSearch(
                        items: controller.subCategoriesListName,
                        onChanged: (value) async {
                          await controller.updateBrand(value);
                        },
                        popupProps: const PopupProps.menu(
                          showSearchBox: false,
                          scrollbarProps: ScrollbarProps(),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: controller.selectedBrand,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Get.width * 0.2),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GetBuilder<ListAdsController>(builder: (context) {
                  return Visibility(
                    visible: controller.subCatListName.isEmpty ? false : true,
                    child: Row(
                      children: [
                        const VerticalDivider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                        ),
                        SizedBox(
                          height: Get.width * 0.09,
                          width: Get.width * 0.3,
                          child: DropdownSearch(
                            items: controller.subCatListName,
                            onChanged: (value) {
                              controller.updateSubBrand(value!);
                            },
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: controller.secondBrand,
                                filled: true,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<ListAdsController>(
        builder: (cntx) {
          if (cntx.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MasonryGridView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              mainAxisSpacing: Get.width * 0.05,
              crossAxisSpacing: Get.width * 0.04,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: controller.listAds.length,
              itemBuilder: (context, index) {
                if (index < controller.listAds.length) {
                  return productBox(
                    id: controller.listAds[index].id!,
                    image: controller.listAds[index].images!.first,
                    title: controller.listAds[index].title!,
                    desc: controller.listAds[index].desc!,
                    price: controller.listAds[index].price!,
                    created: controller.listAds[index].created!,
                    userId: controller.listAds[index].userId!,
                  );
                } else {
                  return const Row(
                    children: [
                      Spacer(),
                      CircularProgressIndicator(),
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
