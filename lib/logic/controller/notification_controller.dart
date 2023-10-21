import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/Data/APIs/notification_api.dart';
import 'package:sooqin/models/notification_model.dart';

class NotificationController extends GetxController {
  final box = GetStorage();
  RxList<NotificationModel> listNotifications = <NotificationModel>[].obs;

  RxBool isOpen = false.obs;

  RxBool isLoading = true.obs;

  @override
  onInit() {
    getData();

    super.onInit();
  }

  Future<void> getData() async {
    List<NotificationModel> notifications =
        await getNotificationApi(token: box.read('token'), page: 1);
    listNotifications.addAll(notifications);

    if (box.read('not') == null) {
      box.write('not', 0);
    }

    if (box.read('not') != listNotifications.length) {
      isOpen(false);
      box.write('not', listNotifications.length);
    } else {
      isOpen(true);
    }

    isLoading(true);
  }

  void openNotification() {
    isOpen(true);
  }
}
