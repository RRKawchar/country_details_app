import 'package:countries_details_app/data/network/api_enpoint.dart';
import 'package:countries_details_app/data/network/network_api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/res/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {

  RxBool isLoading = false.obs;
  final Rx<TextEditingController> srController = TextEditingController().obs;
  final Rx<FocusNode> searchFocusNode = FocusNode().obs;
  RxList<CountryModel> searchList = <CountryModel>[].obs;

  @override
  void onClose() {
    srController.value.dispose();
    searchFocusNode.value.dispose();
    super.onClose();
  }

  void searchCountryByNameT(String countryName) async {
    try {
      isLoading(true);
      dynamic responseBody = await NetworkApiService.handleResponse(
          await NetworkApiService.getRequest(
              ApiEnPoint.searchByCountryName(countryName)));

      if (responseBody != null) {
        searchList.value = [];
        for (var country in responseBody) {
          searchList.add(CountryModel.fromJson(country));
        }
      } else {
        isLoading(false);
        throw 'Unable to load Country list';
      }
    } catch (e) {
      kPrint('Error: $e');
      isLoading(false);
      throw 'Unable to load Country list';
    } finally {
      isLoading(false);
    }
  }
}
