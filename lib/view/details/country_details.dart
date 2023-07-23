import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/view/details/widgets/coat_of_arms_widget.dart';
import 'package:countries_details_app/view/details/widgets/details_flag_about_widget.dart';
import 'package:countries_details_app/view/details/widgets/details_google_map.dart';
import 'package:countries_details_app/view/details/widgets/details_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryDetails extends StatelessWidget {
  final CountryModel countryModel;
  const CountryDetails({Key? key, required this.countryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          },icon: const Icon(Icons.arrow_back_ios),),
          title: Text(countryModel.name.toString()),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Flags and about text
                  DetailsFlagAboutWidget(countryModel: countryModel),
                  const SizedBox(height: 10),

                  /// Area, Population, Continents, Time Zone
                  DetailsItems(countryModel: countryModel),
                  const SizedBox(height: 10),

                  /// Country Map
                  DetailsGoogleMap(countryModel: countryModel),
                  const SizedBox(height: 10),

                  /// Coat of Arms
                  CoatOfArmsWidget(countryModel: countryModel,)
                ],
              ),
            ),
          ),
        ));
  }
}
