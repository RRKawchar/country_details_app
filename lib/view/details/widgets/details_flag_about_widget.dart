import 'package:countries_details_app/components/custom_network_image.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';

class DetailsFlagAboutWidget extends StatelessWidget {
  final CountryModel countryModel;
  const DetailsFlagAboutWidget({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 200,
            width: double.infinity,
            child: CustomNetworkImage(
              image: countryModel.flags!.png.toString(),
            )),
        const CustomText(text: "About flag:",fontWeight: FontWeight.bold,size: 30,),
        CustomText(text: "\t\t\t\t\t\t\t\t${countryModel.flags!.alt.toString()}",maxLines: 10,size: 18,),

      ],
    );
  }
}
