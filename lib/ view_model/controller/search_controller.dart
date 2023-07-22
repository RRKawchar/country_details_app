import 'dart:convert';

import 'package:countries_details_app/data/network/api_enpoint.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class FilterController extends GetxController{

  final Rx<TextEditingController> srController=TextEditingController().obs;
  Rx<FocusNode> searchFocusNode = FocusNode().obs;

  final _country = CountryModel().obs;
  CountryModel get country => _country.value;


  void searchCountryByName(String countryName) async {
    final url = Uri.parse(ApiEnPoint.searchByCountryName(countryName));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)[0];
      _country.value = CountryModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

}