import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsGoogleMap extends StatelessWidget {
  final CountryModel countryModel;
  const DetailsGoogleMap({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: Center(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  countryModel.latlng![0], countryModel.latlng![1]),
              zoom: 6,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('country_marker'),
                position: LatLng(countryModel.latlng![0],
                    countryModel.latlng![1]),
              ),
            },
          ),
        ));
  }
}
