import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/sqldb.dart';
import 'package:sooqin/core/utils/app_strings.dart';

class ButtonFavorite extends StatefulWidget {
  final double? size;
  final int? id;
  final String? title;
  final String? image;
  final String? created;
  final String? price;
  final String? desc;
  final String? userId;
  const ButtonFavorite({
    super.key,
    this.size,
    required this.id,
    required this.title,
    required this.image,
    required this.created,
    required this.price,
    required this.desc,
    required this.userId,
  });

  @override
  State<ButtonFavorite> createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  bool isFavorite = false;

  @override
  void initState() {
    checkFavorite(id: widget.id.toString()).then((value) => setState(
          () {
            isFavorite = value;
          },
        ));
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Get.snackbar(
            AppStrings.appName,
            isFavorite
                ? 'تم حذف المادة من المفضلة'
                : 'تم إظافة المادة الى المفضلة');

        if (isFavorite == false) {
          addFavorite(
            id: widget.id.toString(),
            title: widget.title!,
            image: widget.image!,
            price: widget.price!,
            created: widget.created!,
            desc: widget.desc!,
            userId: widget.userId!,
          ).then((value) {
            setState(
              () {
                isFavorite = true;
              },
            );
          });
        } else {
          deleteFavorite(id: widget.id.toString()).then(
            (value) => setState(
              () {
                isFavorite = false;
              },
            ),
          );
        }
      },
      icon: Icon(
        Icons.favorite_rounded,
        color: isFavorite ? Colors.red : Colors.white,
        size: widget.size ?? 28,
      ),
    );
  }
}

Future<bool> checkFavorite({required String id}) async {
  bool isFavorite = false;
  List<Map> response =
      await SqlDb().readData("SELECT * FROM favorite WHERE product_id = $id");

  if (response.isEmpty) {
    isFavorite = false;
  } else {
    isFavorite = true;
  }
  return isFavorite;
}

Future<bool> addFavorite({
  required String id,
  required String title,
  required String image,
  required String created,
  required String price,
  required String desc,
  required String userId,
}) async {
  bool isFavorite = false;
  int response = await SqlDb().insertData('''
                                     INSERT INTO favorite ("product_id" , "title", "image", "created", "price", "desc", "userId")
                                     VALUES ("$id", "$title", "$image", "$created", "$price", "$desc","$userId")
                                      ''');

  if (response > 0) {
    isFavorite = true;
  }
  return isFavorite;
}

Future<bool> deleteFavorite({required String id}) async {
  bool isFavorite = false;
  int delete =
      await SqlDb().deleteData("DELETE FROM favorite WHERE product_id= $id");
  if (delete.isFinite) {
    isFavorite = false;
  }

  return isFavorite;
}
