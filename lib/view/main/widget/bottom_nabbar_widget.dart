import 'package:countries_details_app/%20view_model/controller/main_controller.dart';
import 'package:countries_details_app/res/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarWidget extends StatelessWidget {
  final MainController mainController;
  const BottomNavbarWidget({Key? key, required this.mainController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomNavigationBar(
          currentIndex: mainController.selectedIndex.value,
          onTap: (index) {
            mainController.onTapped(index);
          },
          selectedItemColor: AppColor.primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
              icon: mainController.selectedIndex.value == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: "home".tr,
            ),
            BottomNavigationBarItem(
              icon: mainController.selectedIndex.value == 1
                  ? const Icon(Icons.map)
                  : const Icon(Icons.map_outlined),
              label: "continent".tr,
            ),
             BottomNavigationBarItem(
              icon:const Icon(Icons.settings),
              label: "settings".tr,
            ),
          ],
        );
      },
    );
  }
}
