import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sooqin/Data/APIs/logout_api.dart';
import 'package:sooqin/Data/APIs/profil_api.dart';
import 'package:sooqin/models/profil_model.dart';
import 'package:sooqin/routes/routes.dart';

class MyAccountController extends GetxController {
  final box = GetStorage();
  ProfilModel profilData = ProfilModel();
  RxBool isLoading = true.obs;
  RxBool isPermission = true.obs;

  @override
  void onInit() {
    getData();
    checkPermission();
    super.onInit();
  }

  Future<void> getData() async {
    profilData = await profilApi(token: box.read('token'));
    isLoading(false);
  }

  Future<void> checkPermission() async {
    if (await Permission.notification.isGranted) {
      isPermission(true);
    } else {
      isPermission(false);
    }
  }

  Future<void> changePermission() async {
    await openAppSettings().whenComplete(() async {
      if (await Permission.notification.isGranted) {
        isPermission(true);
      } else {
        isPermission(false);
      }
    });
  }

  Future<void> logOut() async {
    isLoading(true);
    update();
    await logoutApi(token: box.read('token')).then((value) {
      box.erase();
      isLoading(false);
      Get.offAllNamed(AppRoutes.home);
    });
  }
}
