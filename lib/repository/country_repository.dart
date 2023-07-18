import 'package:countries_details_app/data/network/network_api_service.dart';
import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/res/app_url/app_url.dart';

class CountryRepository{

final _apiService=NetworkApiService();

Future<List<CountryModel>> countriesApiList()async{
dynamic response=await _apiService.getApi(AppUrl.countryApi);

return response;
}


}