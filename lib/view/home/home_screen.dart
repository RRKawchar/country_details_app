import 'package:countries_details_app/%20view_model/controller/home_controller.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/view/home/widgets/home_appbar_widget.dart';
import 'package:countries_details_app/view/home/widgets/home_grid_view.dart';
import 'package:countries_details_app/view/home/widgets/home_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbarWidget(
          leading: Obx(() => IconButton(
                onPressed: () {
                  homeController.changeView();
                },
                icon: homeController.isGridView.value
                    ? const Icon(Icons.grid_view)
                    : const Icon(Icons.list),
              ))),
      body: SafeArea(
        child: Obx(
          () {
            if (homeController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (homeController.countriesList.isEmpty) {
              return const Center(
                child: CustomText(
                  text: "No found data",
                ),
              );
            }
            return homeController.isGridView.value
                ? HomeListItem(homeController: homeController)
                : HomeGridView(homeController: homeController);
          },
        ),
      ),
    );
  }
}
