import 'package:countries_details_app/%20view_model/controller/search_controller.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/components/single_item.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBodyItem extends StatelessWidget {
  final FilterController searchController;
  const SearchBodyItem({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchController.searchList.isEmpty) {
        return  Center(
          child: CustomText(
            text: "search_text".tr,
          ),
        );
      } else if (searchController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (searchController.srController.value.text.isEmpty) {
        return  Center(
          child: CustomText(
            text: "search_text".tr,
          ),
        );
      } else {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: searchController.searchList.length,
          itemBuilder: (context, index) {
            final countriesList = searchController.searchList[index];
            return SingleItem(
              onTap: () {
                Get.to(CountryDetails(
                  countryModel: countriesList,
                ));
              },
              image: countriesList.flags!.png.toString(),
              title: countriesList.name.toString(),
              trailing: countriesList.cioc.toString(),
            );
          },
        );
      }
    });
  }
}
