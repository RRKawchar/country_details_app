import 'package:countries_details_app/data/network/api_enpoint.dart';
import 'package:countries_details_app/data/network/network_api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/res/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<CountryModel> countriesList = <CountryModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool isGridView = true.obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    try {
      isLoading.value = true;
      dynamic responseBody = await NetworkApiService.handleResponse(
          await NetworkApiService.getRequest(ApiEnPoint.countryApi));

      if (responseBody != null) {
        countriesList.value = [];
        for (var country in responseBody) {
          countriesList.add(CountryModel.fromJson(country));
        }
      } else {
        isLoading.value = false;
        throw 'Unable to load Country list';
      }
    } catch (e) {
      kPrint(e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }


  void changeView(){
    isGridView.value=!isGridView.value;
  }
}
