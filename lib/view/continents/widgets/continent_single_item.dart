import 'package:countries_details_app/components/custom_network_image.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/res/app_color/app_color.dart';
import 'package:countries_details_app/view/continents_countries/continents_countries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinentSingleItem extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> continentList;
  const ContinentSingleItem({
    Key? key,
    required this.index,
    required this.continentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(ContinentsCountries(
              index: index,
              continentList: continentList,
            ));
          },
          child: Container(
              height: 200,
              width: Get.height,
              color: AppColor.primaryColor.withOpacity(0.4),
              alignment: Alignment.center,
              child: CustomNetworkImage(
                image: continentList[index]['image'],
              )),
        ),
        CustomText(
          text: continentList[index]['name'],
          size: 22,
        )
      ],
    );
  }
}
