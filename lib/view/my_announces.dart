import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sooqin/logic/controller/my_annonce_controller.dart';
import '../core/widgets/product_box.dart';

class MyAnnoncesView extends StatelessWidget {
  MyAnnoncesView({
    super.key,
  });

  final controller = ScrollController();
  final myAnnonceController = Get.put(MyAnnonceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('اعلاناتي'),
          ),
          body: Obx(() {
            if (myAnnonceController.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return MasonryGridView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                mainAxisSpacing: 32,
                crossAxisSpacing: 18,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: myAnnonceController.myAds.length,
                itemBuilder: (context, index) {
                  if (index < myAnnonceController.myAds.length) {
                    return productBox(
                      id: myAnnonceController.myAds[index].id!,
                      image: myAnnonceController.myAds[index].images![0],
                      title: myAnnonceController.myAds[index].title!,
                      desc: myAnnonceController.myAds[index].desc!,
                      price: myAnnonceController.myAds[index].price!,
                      created: myAnnonceController.myAds[index].created!,
                      userId: myAnnonceController.myAds[index].userId!,
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
          })),
    );
  }
}
