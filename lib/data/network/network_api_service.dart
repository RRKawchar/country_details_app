
import 'dart:convert';
import 'dart:io';
import 'package:countries_details_app/models/country_model.dart';
import 'package:countries_details_app/res/utils.dart';
import 'package:http/http.dart' as http;

class NetworkApiService {


  static var noInternetMessage = "Please check your internet connection!";
  static getRequest(String url) async {
    final response = await http.get(Uri.parse(url));

    return response;
  }



  static handleResponse(http.Response response) {
    try {
      if (response.statusCode >= 200 && response.statusCode <= 210) {
        kPrint("SuccessCode : ${response.statusCode}");
        kPrint("SuccessBody : ${response.body}");

        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        String msg = "Unauthorized";
        if (response.body.isNotEmpty) {
          if (jsonDecode(response.body)['error'] != null) {
            msg = jsonDecode(response.body)['error'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        throw "Page not found";
      } else if (response.statusCode == 500) {
        throw "Server Error";
      } else {
        kPrint("Error Code : ${response.statusCode}");
        kPrint("Error response : ${response.body}");
        String msg = "Something went wrong";

        throw msg;
      }
    } on SocketException catch (_) {
      throw noInternetMessage;
    } on FormatException catch (_) {
      throw "Bad Exception success";
    } catch (e) {
      kPrint(e.toString());
    }
  }


}
