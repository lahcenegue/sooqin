import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sooqin/logic/controller/favorite_controller.dart';
import '../core/widgets/product_box.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  final controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('المفضلة'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GetBuilder<FavoriteController>(
          builder: (context) {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return MasonryGridView.builder(
                physics: const BouncingScrollPhysics(),
                mainAxisSpacing: Get.width * 0.05,
                crossAxisSpacing: Get.width * 0.04,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.response.length,
                itemBuilder: (context, index) {
                  return productBox(
                    widthSceeren: Get.width,
                    id: int.parse(controller.response[index]['product_id']),
                    image: controller.response[index]['image'],
                    title: controller.response[index]['title'],
                    desc: controller.response[index]['desc'],
                    price: controller.response[index]['price'],
                    created: controller.response[index]['created'],
                    userId: controller.response[index]['userId'],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
