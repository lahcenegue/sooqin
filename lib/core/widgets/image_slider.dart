import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sooqin/core/utils/app_strings.dart';
import 'package:sooqin/core/widgets/shimmer_loading.dart';

class ImagesSlider extends StatefulWidget {
  final List urlImages;

  const ImagesSlider({
    super.key,
    required this.urlImages,
  });

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final controller = CarouselController();

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Get.height * 0.4,
      color: Colors.transparent,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: widget.urlImages.length,
            itemBuilder: (context, index, realindex) {
              final urlImage = widget.urlImages[index];
              return buildImage(urlImage, index, Get.height * 0.4,
                  MediaQuery.of(context).size.width);
            },
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              height: Get.height * 0.4,
              autoPlay: true,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2.1,
            child: buildIndicator(),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
          dotWidth: 5,
          activeDotColor: Colors.white,
        ),
        activeIndex: activeIndex,
        count: widget.urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index, double height, double width) =>
    Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: urlImage.isEmpty
          ? const Icon(Icons.error)
          : CachedNetworkImage(
              imageUrl: urlImage,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(
                child: ShimmerLoading(
                  type: AppStrings.banner,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
