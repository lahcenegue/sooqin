import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooqin/core/utils/app_icons.dart';
import 'package:sooqin/core/widgets/text_form.dart';
import 'package:sooqin/logic/controller/add_ads_controller.dart';
import 'package:sooqin/logic/controller/categories_controller.dart';
import '../core/utils/app_colors.dart';

class AddAdsView extends StatelessWidget {
  AddAdsView({
    super.key,
  });

  final addController = Get.find<AddAdsController>();
  final catController = Get.find<CategoriesController>();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () {
            return addController.returnBack();
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'اضف اعلان',
                textAlign: TextAlign.center,
              ),
            ),
            body: GetBuilder<AddAdsController>(builder: (cntx) {
              /////////////////////////////////////////////////////////////////
              return Stepper(
                type: StepperType.horizontal,
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await addController.goToNextStape();
                        },
                        child: Text(
                          addController.currentStep == 2 ? 'ارسال' : 'التالي',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Get.width * 0.06,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          addController.goToBackStape();
                        },
                        child: Text(
                          addController.currentStep == 0 ? 'خروج' : 'رجوع',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Get.width * 0.05,
                          ),
                        ),
                      ),
                    ],
                  );
                },

                // on Tapped
                onStepTapped: (int index) {
                  addController.getCurrentStep(index);
                },

                // current Step
                currentStep: addController.currentStep,

                steps: [
                  Step(
                    isActive: addController.currentStep >= 0,
                    title: Container(
                      height: Get.width * 0.12,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                        color: addController.currentStep >= 0
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Image.asset(
                        AppIcons.cat,
                        color: addController.currentStep >= 0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    content: Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          // category
                          Center(
                            child: Text(
                              'اختر القسم المناسب',
                              style: TextStyle(
                                fontSize: Get.width * 0.06,
                              ),
                            ),
                          ),
                          SizedBox(height: Get.width * 0.08),
                          SizedBox(
                            height: Get.height * 0.072,
                            child: DropdownSearch(
                              items: catController.categoriesListName,
                              onChanged: (value) {
                                catController.getCatID1(value);
                              },
                              popupProps: const PopupProps.menu(
                                scrollbarProps: ScrollbarProps(),
                              ),
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "الأقسام",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(08),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.022),

                          // sub category
                          SizedBox(
                            height: Get.height * 0.072,
                            child: GetBuilder<CategoriesController>(
                              builder: (cntx) {
                                return DropdownSearch(
                                  items: catController.subCatListName,
                                  enabled: catController.catId1 == null
                                      ? false
                                      : true,
                                  onChanged: (value) async {
                                    catController.getCatID2(value);
                                  },
                                  popupProps: const PopupProps.menu(
                                    scrollbarProps: ScrollbarProps(),
                                  ),
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "الأقسام الفرعية",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(08),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          //////////===============>>>>>>>>>>>>>>>sub cat all
                          /// الاقسام الثانوية
                          ///

                          GetBuilder<CategoriesController>(
                            builder: (context) {
                              return Visibility(
                                visible: catController.isLoading ||
                                    catController.subCat3Name.isNotEmpty,
                                child: Column(
                                  children: [
                                    SizedBox(height: Get.height * 0.022),
                                    SizedBox(
                                      height: Get.height * 0.072,
                                      child: catController.isLoading == true
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : DropdownSearch(
                                              items: catController.subCat3Name,
                                              onChanged: (value) {
                                                catController.getCatID3(value);
                                              },
                                              popupProps: const PopupProps.menu(
                                                scrollbarProps:
                                                    ScrollbarProps(),
                                              ),
                                              dropdownDecoratorProps:
                                                  const DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    InputDecoration(
                                                  labelText: "الأقسام الثانوية",
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(08),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          //////
                          ///
                          GetBuilder<CategoriesController>(builder: (context) {
                            return Visibility(
                              visible: catController.subCat4Name.isNotEmpty,
                              child: Column(
                                children: [
                                  SizedBox(height: Get.height * 0.022),
                                  SizedBox(
                                    height: Get.height * 0.072,
                                    child: DropdownSearch(
                                      items: catController.subCat4Name,
                                      onChanged: (value) {
                                        catController.getCatID4(value);
                                      },
                                      popupProps: const PopupProps.menu(
                                        scrollbarProps: ScrollbarProps(),
                                      ),
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: " 2الأقسام الثانوية",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(08),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          SizedBox(height: Get.height * 0.05),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    isActive: addController.currentStep >= 1,
                    title: Container(
                      height: Get.width * 0.12,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                        color: addController.currentStep >= 1
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Image.asset(
                        AppIcons.info,
                        color: addController.currentStep >= 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    content: Column(
                      children: [
                        Center(
                          child: Text(
                            'ادخل معلومات الاعلان',
                            style: TextStyle(
                              fontSize: Get.width * 0.06,
                            ),
                          ),
                        ),
                        // title
                        //SizedBox(height: Get.height * 0.02),

                        customTextFormField(
                          hintText: 'العنوان',
                          onChanged: (value) {
                            addController.writeAddAds('name', value);
                          },
                        ),

                        //price

                        customTextFormField(
                          hintText: 'السعر',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            addController.writeAddAds('amount', value);
                          },
                        ),

                        //descreption

                        customTextFormField(
                          hintText: 'الوصف',
                          keyboardType: TextInputType.text,
                          maxLine: 5,
                          onChanged: (value) {
                            addController.writeAddAds('comment', value);
                          },
                        ),

                        SizedBox(height: Get.height * 0.05),
                      ],
                    ),
                  ),
                  Step(
                    isActive: addController.currentStep >= 2,
                    title: Container(
                      height: Get.width * 0.12,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                        color: addController.currentStep >= 2
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Image.asset(
                        AppIcons.image,
                        color: addController.currentStep >= 2
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    content: Column(
                      children: [
                        Center(
                          child: Text(
                            'حمل صور الاعلان',
                            style: TextStyle(
                              fontSize: Get.width * 0.06,
                            ),
                          ),
                        ),
                        // picturs
                        SizedBox(
                          height: addController.selectedImages.isEmpty
                              ? Get.height * 0.2
                              : Get.height * 0.43,
                          width: Get.width,
                          child: addController.selectedImages.isEmpty
                              ? Center(
                                  child: Text(
                                    'لم تحمل الصور بعد',
                                    style: TextStyle(
                                      fontSize: Get.height * 0.025,
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.all(12),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      addController.selectedImages.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: Get.height * 0.05,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: Get.height * 0.4,
                                      width: Get.width * 0.6,
                                      child: Stack(
                                        children: [
                                          Image.file(
                                            addController.selectedImages[index],
                                            height: Get.height * 0.4,
                                            width: Get.width * 0.6,
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            child: IconButton(
                                              onPressed: () {
                                                addController
                                                    .removeImage(index);
                                              },
                                              icon: Icon(
                                                Icons.remove_circle,
                                                color: Colors.red,
                                                size: Get.height * 0.04,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            child: IconButton(
                                              onPressed: () {
                                                addController
                                                    .selecetMainImage(index);
                                              },
                                              icon: Icon(
                                                Icons.check_circle,
                                                color:
                                                    addController.mainImage ==
                                                            index
                                                        ? Colors.green
                                                        : Colors.blue,
                                                size: Get.height * 0.04,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(Get.height * 0.072),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            await addController.downloadImages();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                  Icons.photo_size_select_actual_rounded),
                              Text(
                                'حمل الصور',
                                style: TextStyle(
                                  fontSize: Get.height * 0.025,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: Get.height * 0.04),
                      ],
                    ),
                  )
                ],
              );
              ///////////////////////////////////////////////////////////////////////////////////////////////////
            }),
          ),
        ),
        GetBuilder<AddAdsController>(builder: (context) {
          return Visibility(
            visible: addController.isApiCallProcess ? true : false,
            child: Stack(
              children: [
                ModalBarrier(
                  color: Colors.white.withOpacity(0.6),
                  dismissible: true,
                ),
                const Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          );
        }),
      ],
    );
  }

  bool validateAndSave() {
    final FormState? form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
