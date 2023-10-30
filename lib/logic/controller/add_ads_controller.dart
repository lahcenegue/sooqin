import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sooqin/Data/APIs/add_ads_api.dart';
import 'package:sooqin/core/utils/app_strings.dart';
import 'package:sooqin/logic/controller/categories_controller.dart';
import 'package:sooqin/models/add_ads.dart';
import 'package:sooqin/models/subcat_model.dart';
import 'package:sooqin/routes/routes.dart';

class AddAdsController extends GetxController {
  final catController = Get.find<CategoriesController>();
  final box = GetStorage();
  bool isApiCallProcess = false;
  //bool isLoading = false;
  int currentStep = 0;

  // pick Image
  List<File> selectedImages = [];
  int mainImage = 0;
  String mainImageBase64 = '';
  //

  //
  SubCatModel subCategories = SubCatModel();
  List<String> subCategoriesListName = <String>[];
  List<int> subCategoriesListId = <int>[];
  List<SubAll> subCategoriesListAll = <SubAll>[];
  List<String> subCategoriesListAllName = <String>[];
  List<int> subCategoriesListAllId = <int>[];

  // add Request
  AddAdsRequest addAdsRequest = AddAdsRequest();

  int index = 0;

  @override
  onInit() {
    addAdsRequest.token = box.read('token');
    super.onInit();
  }

  void writeAddAds(String id, String value) {
    switch (id) {
      case 'name':
        {
          addAdsRequest.name = value;
          update();
        }
        break;

      case 'amount':
        {
          addAdsRequest.amount = value;
          update();
        }
        break;

      case 'comment':
        {
          addAdsRequest.comment = value;
          update();
        }
        break;

      case 'image':
        {
          addAdsRequest.image = value;
          update();
        }
        break;
    }
  }

  //
  // images

  Future<void> downloadImages() async {
    if (selectedImages.length < 4) {
      await getImages();
    } else {
      Get.snackbar(
        AppStrings.appName,
        'لا يمكن تحميل اكثر من 4 صور',
      );
    }
  }

  Future getImages() async {
    final pickedFile = await ImagePicker().pickMultiImage();
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }

      Uint8List imagebytes = selectedImages[mainImage].readAsBytesSync();

      mainImageBase64 = base64Encode(imagebytes);
      addAdsRequest.image = mainImageBase64;
      update();
    } else {
      Get.snackbar(AppStrings.appName, 'لم يتم اختيار الصور');
    }
  }

  void selecetMainImage(int index) {
    mainImage = index;
    Uint8List imagebytes = selectedImages[mainImage].readAsBytesSync();
    mainImageBase64 = base64Encode(imagebytes);
    update();
    Get.snackbar(
        AppStrings.appName, 'تم اختيار الصورة ${index + 1} كصورة رئيسية');
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    update();
  }

  /////
  ///
  ///
  //
  Future<void> sendData() async {
    isApiCallProcess = true;

    update();
    await addAdsApi(addAdsRequest: addAdsRequest).then((value) {
      isApiCallProcess = false;
      update();
      if (value.msg == 'ok') {
        Get.offAllNamed(Routes.splash);
      }
    });
  }

  //
  // navigation in stepper
  //
  void getCurrentStep(int index) {
    currentStep = index;
    update();
  }

  //
  Future<void> goToNextStape() async {
    if (currentStep == 0) {
      addAdsRequest.catid1 =
          catController.catId1 == null ? '' : catController.catId1.toString();
      addAdsRequest.catid2 =
          catController.catId2 == null ? '' : catController.catId2.toString();
      addAdsRequest.catid3 =
          catController.catId3 == null ? '' : catController.catId3.toString();
      addAdsRequest.catid4 =
          catController.catId4 == null ? '' : catController.catId4.toString();

      if ((addAdsRequest.catid1!.isNotEmpty) &&
          (addAdsRequest.catid2!.isNotEmpty)) {
        currentStep += 1;
        update();
      } else {
        Get.snackbar(
          AppStrings.appName,
          'يجب اختيار الاقسام المناسبة',
        );
      }
    } else if (currentStep == 1) {
      if ((addAdsRequest.name != null) &&
          (addAdsRequest.amount != null) &&
          (addAdsRequest.comment != null)) {
        currentStep += 1;
        update();
      } else {
        Get.snackbar(AppStrings.appName, 'ادخل كامل المعلومات');
      }
    } else {
      if (mainImageBase64.isEmpty) {
        Get.snackbar(AppStrings.appName, 'يجب اختيار الصور');
      } else {
        await sendData();
      }
    }
  }

  //
  void goToBackStape() {
    if (currentStep > 0) {
      currentStep -= 1;
      update();
    } else {
      returnBack();
    }
  }

  //

  Future<bool> returnBack() async {
    Get.defaultDialog(
      title: AppStrings.appName,
      content: Text(
        'هل تريد تأكيد الرجوع؟',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: Get.height * 0.02),
      ),
      textCancel: 'إكمال',
      textConfirm: 'تأكيد الرجوع',
      onConfirm: () {
        Get.offAllNamed(Routes.splash);
      },
    );
    return true;
  }
}
