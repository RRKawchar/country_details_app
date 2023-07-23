import 'package:countries_details_app/%20view_model/controller/home_controller.dart';
import 'package:countries_details_app/components/custom_network_image.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/res/app_color/app_color.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeGridView extends StatelessWidget {
  final HomeController homeController;
  const HomeGridView({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      itemCount: homeController.countriesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 4.0,
        mainAxisExtent: 180,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(CountryDetails(countryModel: homeController.countriesList[index]));
              },
              child: Container(
                  height: 130,
                  width: Get.height,
                  color: AppColor.primaryColor.withOpacity(0.4),
                  alignment: Alignment.center,
                  child: CustomNetworkImage(
                    image:homeController.countriesList[index].flags!.png.toString(),
                  )),
            ),
            CustomText(
              text: homeController.countriesList[index].name.toString(),
              size: 15,
            )
          ],
        );
      },
    );
  }
}
