import 'package:countries_details_app/%20view_model/controller/main_controller.dart';
import 'package:countries_details_app/view/main/widget/bottom_nabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: mainController.pages[mainController.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: BottomNavbarWidget(mainController: mainController,)
    );
  }
}
