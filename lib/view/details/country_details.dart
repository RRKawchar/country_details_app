import 'dart:async';

import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryDetails extends StatefulWidget {
   final CountryModel countryModel;
  const CountryDetails({Key? key, required this.countryModel,}) : super(key: key);

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  static const LatLng _initialPosition = LatLng(24.147754030382274, 90.23052063035128);

  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.countryModel.name.toString()),
      ),
      body:Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.red,
            child:widget.countryModel.currencies==null?const Text(""): Text(widget.countryModel.currencies!.jOD!.name.toString()),
          ),
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.countryModel.latlng![0], widget.countryModel.latlng![1]), // Country's latitude and longitude
                      zoom: 6,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('country_marker'),
                        position: LatLng(widget.countryModel.latlng![0], widget.countryModel.latlng![1]),
                      ),
                    },
                ),
                ))

            ],
          )
        ],
      )
    );
  }

}
