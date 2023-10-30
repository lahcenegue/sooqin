// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class BannerSlider extends StatelessWidget {
//   final List urlImages;
//   final double height;
//   const BannerSlider({
//     super.key,
//     required this.urlImages,
//     required this.height,
//   });

//   //final controller = CarouselController();
//   //int activeIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CarouselSlider.builder(
//           itemCount: urlImages.length,
//           itemBuilder: (context, index, realindex) {
//             final urlImage = urlImages[index];
//             return buildImage(urlImage, index);
//           },
//           options: CarouselOptions(
//             aspectRatio: 16 / 9,
//             viewportFraction: 1,
//             height: height,
//             autoPlay: false,
//             enableInfiniteScroll: false,
//             autoPlayAnimationDuration: const Duration(seconds: 2),
//             enlargeCenterPage: true,
//             //onPageChanged: (index, reason) {},
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildImage(String urlImage, int index) => Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             image: NetworkImage(urlImage),
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
// }
