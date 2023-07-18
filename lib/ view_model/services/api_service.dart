import 'dart:convert';

import 'package:countries_details_app/models/country_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://restcountries.com/v3.1/all';

  Future<List<CountryModel>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((json) => CountryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
