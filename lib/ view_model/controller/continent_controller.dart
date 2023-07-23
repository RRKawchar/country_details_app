import 'package:countries_details_app/data/network/api_enpoint.dart';
import 'package:countries_details_app/data/network/network_api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/res/utils/utils.dart';
import 'package:get/get.dart';

class ContinentController extends GetxController {

  RxList<CountryModel> countryList = <CountryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchContinentsCountries(String continentName) async {
    try {
      isLoading(true);
      dynamic responseBody = await NetworkApiService.handleResponse(
          await NetworkApiService.getRequest(
              ApiEnPoint.countriesOfContinent(continentName)));
      if (responseBody != null) {
        countryList.value = [];
        for (var continent in responseBody) {
          var countryModel = CountryModel.fromJson(continent);
          countryList.add(countryModel);
        }
      } else {
        isLoading(false);
        throw "Unable to load data";
      }
    } catch (e) {
      kPrint(e.toString());
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
