import 'package:countries_details_app/%20view_model/controller/home_controller.dart';
import 'package:countries_details_app/components/single_item.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeListItem extends StatelessWidget {
  final HomeController homeController;
  const HomeListItem({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      itemCount: homeController.countriesList.length,
      itemBuilder: (context, index) {
        final countriesList = homeController.countriesList[index];

        return SingleItem(
            onTap: () {
              Get.to(CountryDetails(
                countryModel: countriesList,
              ));
            },
            image: countriesList.flags!.png.toString(),
            title: countriesList.name.toString(),
            trailing: countriesList.cioc.toString());
      },
    );
  }
}
