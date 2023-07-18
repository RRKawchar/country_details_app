import 'package:countries_details_app/%20view_model/services/api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<CountryModel> countries = <CountryModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    try {
      isLoading.value = true;
      final fetchedCountries = await _apiService.fetchCountries();
      countries.assignAll(fetchedCountries);
    } catch (e) {
     print("My Error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
