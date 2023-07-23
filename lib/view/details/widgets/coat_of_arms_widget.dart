import 'package:countries_details_app/components/custom_network_image.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';

class CoatOfArmsWidget extends StatelessWidget {
  final CountryModel countryModel;
  const CoatOfArmsWidget({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const CustomText(
          text: "Coat of Arms",
          size: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 300,
            width: double.infinity,
            child: CustomNetworkImage(
              image: countryModel.coatOfArms!.png.toString(),
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
