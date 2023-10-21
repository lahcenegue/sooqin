import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_icons.dart';
import 'package:sooqin/core/widgets/button_favorite.dart';
import 'package:sooqin/routes/routes.dart';
//TODO

Widget productBox({
  required double widthSceeren,
  required int id,
  required String image,
  required String title,
  required String desc,
  required String price,
  required String created,
  required String userId,
}) {
  return InkWell(
    onTap: () {
      Get.toNamed(
        Routes.adsPage,
        arguments: {'id': id},
      );
    },
    child: Stack(
      children: [
        Container(
          height: widthSceeren * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSceeren * 0.03),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: widthSceeren * 0.45,
                height: widthSceeren * 0.44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widthSceeren * 0.03),
                  color: Colors.white,
                ),
                child: image.isEmpty
                    ? const Icon(Icons.error)
                    : CachedNetworkImage(
                        imageUrl: image,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(widthSceeren * 0.03),
                              topRight: Radius.circular(widthSceeren * 0.03),
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  width: widthSceeren * 0.43,
                  height: widthSceeren * 0.24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widthSceeren * 0.03),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: widthSceeren * 0.035,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        desc,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: widthSceeren * 0.03,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffc1c1c1),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppIcons.money,
                            width: widthSceeren * 0.05,
                          ),
                          const SizedBox(width: 08),
                          Text(price),
                          const Spacer(),
                          Text(
                            'منذ $created',
                            style: const TextStyle(
                              color: Color(0xffc1c1c1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ///////
        ButtonFavorite(
          id: id,
          title: title,
          image: image,
          created: created,
          price: price,
          desc: desc,
          userId: userId,
        ),
      ],
    ),
  );
}

//             SizedBox(
//               width: widthSceeren * 0.6,
//               height: widthSceeren * 0.25,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: widthSceeren * 0.5,
//                     child: Text(
//                       title,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: AppColors.primary,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     desc,
//                     maxLines: 2,
//                   ),
//                   iconText(price: price, time: created),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       Positioned(
//         top: 08,
//         left: 08,

//       )
//     ],
//   );