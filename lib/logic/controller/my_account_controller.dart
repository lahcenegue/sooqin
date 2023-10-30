import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sooqin/Data/APIs/logout_api.dart';
import 'package:sooqin/Data/APIs/profil_api.dart';
import 'package:sooqin/Data/APIs/update_profil_api.dart';
import 'package:sooqin/models/profil_model.dart';
import 'package:sooqin/models/update_profil_model.dart';
import 'package:sooqin/routes/routes.dart';

class MyAccountController extends GetxController {
  final box = GetStorage();
  ProfilModel profilData = ProfilModel();
  RxBool isLoading = true.obs;
  RxBool isPermission = true.obs;

  UpdateProfilRequestModel updateProfilRequestModel =
      UpdateProfilRequestModel();

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

  void writeInfo(String id, String value) {
    switch (id) {
      case 'info':
        {
          updateProfilRequestModel.info = value;
          update();
        }
        break;

      case 'email':
        {
          updateProfilRequestModel.email = value;
          update();
        }
        break;
    }
  }

  Future<void> editProfile() async {
    isLoading(true);
    update();
    updateProfilRequestModel.info ??= profilData.info;
    updateProfilRequestModel.email ??= profilData.email;
    await apiUpdateProfil(
            token: box.read('token'),
            updateProfilRequestModel: updateProfilRequestModel)
        .then((value) async {
      if (value.edit == 'ok') {
        profilData = await profilApi(token: box.read('token'));
        isLoading(false);
        Get.offAllNamed(Routes.splash);
      }
    });
  }

  Future<void> logOut() async {
    isLoading(true);
    update();
    await logoutApi(token: box.read('token')).then((value) {
      box.erase();
      isLoading(false);
      Get.offAllNamed(Routes.splash);
    });
  }
}
