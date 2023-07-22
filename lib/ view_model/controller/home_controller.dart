import 'package:countries_details_app/data/network/api_enpoint.dart';
import 'package:countries_details_app/data/network/network_api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/res/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<CountryModel> countriesList = <CountryModel>[].obs;
  RxBool isLoading = true.obs;

  final Rx<TextEditingController> srController = TextEditingController().obs;
  Rx<FocusNode> searchFocusNode = FocusNode().obs;
  RxList<CountryModel> searchList = <CountryModel>[].obs;

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



  void searchCountryByName(String countryName) async {
    try {
      isLoading.value = true;
      dynamic responseBody = await NetworkApiService.handleResponse(
        await NetworkApiService.getRequest(
            ApiEnPoint.searchByCountryName(countryName)),
      );
      if (responseBody != null) {
        searchList.value = [];

        for (var country in responseBody) {
          searchList.add(country);
        }
      }
    } catch (e) {
      isLoading.value = false;
      kPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
