import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';

class DetailsItems extends StatelessWidget {
  final CountryModel countryModel;
  const DetailsItems({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomText(
          text: "Capital: ${countryModel.capital!.first}",
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        CustomText(
          text: "Area:${countryModel.area}",
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        CustomText(
          text: "Population:${countryModel.population}",
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        CustomText(
          text: "Continents:${countryModel.continents![0]}",
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        CustomText(
          text: "Time zone:${countryModel.timeZones}",
          fontWeight: FontWeight.bold,
          size: 20,
        ),
      ],
    );
  }
}
