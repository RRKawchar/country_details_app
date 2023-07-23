import 'package:countries_details_app/%20view_model/controller/continent_controller.dart';
import 'package:countries_details_app/components/custom_network_image.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/res/app_color/app_color.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinentCountriesSingleItem extends StatelessWidget {
  final ContinentController continentController;
  final int index;
  const ContinentCountriesSingleItem(
      {Key? key, required this.continentController, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(CountryDetails(
                countryModel: continentController.countryList[index]));
          },
          child: Container(
              height: 200,
              width: Get.height,
              color: AppColor.primaryColor.withOpacity(0.4),
              alignment: Alignment.center,
              child: CustomNetworkImage(
                image: continentController.countryList[index].flags!.png
                    .toString(),
              )),
        ),
        CustomText(
          text: continentController.countryList[index].name.toString(),
          size: 22,
        )
      ],
    );
  }
}
