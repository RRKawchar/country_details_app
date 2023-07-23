import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/res/app_color/app_color.dart';
import 'package:countries_details_app/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar homeAppbarWidget({required Widget leading }) {
  return AppBar(
    backgroundColor: AppColor.primaryColor,
    leading:leading,
    title: CustomText(
      text: "countries".tr,
      fontWeight: FontWeight.bold,
      size: 30,
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {
            Get.to(CountrySearchScreen());
          },
          icon: const Icon(
            Icons.search,
            size: 40,
          ))
    ],
  );
}
