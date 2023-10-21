import 'package:sooqin/core/utils/app_icons.dart';

String iconPiker(String category) {
  String iconData;
  switch (category) {
    case "محركات":
      {
        iconData = AppIcons.motors;
      }
      break;

    case "عقارات":
      {
        iconData = AppIcons.properties;
      }
      break;
    case "إلكترونيات":
      {
        iconData = AppIcons.electronics;
      }
      break;

    case "مقاولات":
      {
        iconData = AppIcons.construction;
      }
      break;

    case "خدمات":
      {
        iconData = AppIcons.services;
      }
      break;

    case "تخييم":
      {
        iconData = AppIcons.camping;
      }
      break;

    case "حيوانات":
      {
        iconData = AppIcons.animals;
      }
      break;
    case "الأسرة":
      {
        iconData = AppIcons.family;
      }
      break;
    case "هدايا":
      {
        iconData = AppIcons.gifts;
      }
      break;
    case "أثاث":
      {
        iconData = AppIcons.furniture;
      }
      break;
    case "وظائف":
      {
        iconData = AppIcons.functions;
      }
      break;
    case "أغراض متنوعة":
      {
        iconData = AppIcons.divers;
      }
      break;

    default:
      {
        iconData = AppIcons.divers;
      }
      break;
  }

  return iconData;
}
