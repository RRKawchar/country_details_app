import 'package:countries_details_app/data/network/api_enpoint.dart';
import 'package:countries_details_app/data/network/network_api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class FilterController extends GetxController{



  final Rx<TextEditingController> srController=TextEditingController().obs;
  Rx<FocusNode> searchFocusNode = FocusNode().obs;

  RxList<CountryModel> countries = <CountryModel>[].obs;



  void searchCountryByNameT(String countryName) async {
    dynamic responseBody=await NetworkApiService.handleResponse(
        await NetworkApiService.getRequest(ApiEnPoint.searchByCountryName(countryName))
    );

    if(responseBody !=null){
      countries.value = [];
      for(var country in responseBody){
        countries.add(CountryModel.fromJson(country));
      }
    }else {
      throw 'Unable to load Country list';
    }
  }

}