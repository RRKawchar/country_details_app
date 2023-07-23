import 'package:countries_details_app/%20view_model/controller/continent_controller.dart';
import 'package:countries_details_app/view/continents_countries/widgets/continent_countries_single_item.dart';
import 'package:flutter/material.dart';

class ContinentsCountriesItem extends StatelessWidget {
  final ContinentController continentController;
  const ContinentsCountriesItem({Key? key, required this.continentController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: continentController.countryList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          mainAxisExtent: 270),
      itemBuilder: (BuildContext context, int index) {
        return ContinentCountriesSingleItem(
          continentController: continentController,
          index: index,
        );
      },
    );
  }
}
