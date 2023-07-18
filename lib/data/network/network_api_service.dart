import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:countries_details_app/data/network/base_api_service.dart';
import 'package:countries_details_app/data/response/app_exception.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BaseApiService{

  @override
  Future<dynamic> getApi(String url) async{

    dynamic jsonResponse;

    try{
      final response= await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse=returnResponse(response);
    }on SocketException{
      throw InternetException();
    }on TimeoutException{
      throw RequestTimeOut();
    }

    return jsonResponse;

  }


  dynamic returnResponse(http.Response response){
    if(response.statusCode==200){
      dynamic responseJson=jsonDecode(response.body);
      return responseJson;
    }else if(response.statusCode==400){
      dynamic responseJson=jsonDecode(response.body);
      return responseJson;
    }else{
      throw FetchDataException(
          'Error occurred while communication with server${response.statusCode}');
    }
  }


}