import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../jsonModel/shippingModel.dart';
import 'app_exceptions.dart';


class BaseClient {
  static const int timeOutDuration = 10;

  //Get Dynamic Method
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("Api Not responding", uri.toString());
    }
  }

  //Post Dynamic Method
  Future<dynamic> post(String baseUrl, String api, dynamic payLoadObj) async {
    var payload = jsonEncode(payLoadObj);
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.post(uri, body: payload).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("Api not responding", uri.toString());
    }
  }

  //Update Dynamic Method
  Future<dynamic> update(String baseUrl, String api, dynamic payLoadObj) async {
    var payload = jsonEncode(payLoadObj);
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http
          .put(uri, body: payload)
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("Api not responding", uri.toString());
    }
  }



  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
            jsonDecode(response.body), response.request?.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            jsonDecode(response.body), response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException("Error code: ${response.statusCode} ",
            response.request?.url.toString());
    }


  }
}
