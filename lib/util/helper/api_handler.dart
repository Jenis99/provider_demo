import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider_demo/module/home/model/movies_model.dart';
import 'package:provider_demo/util/helper/error_handler.dart';

class ApiHandler {

  static Future<dynamic> postRequest (url,{Map<String,String>? headers,Map<dynamic,dynamic>? body, encoding}) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.post(uri, headers: headers, body: jsonEncode(body), encoding: encoding);
      // print("http response : ${response.statusCode} - ${response.body}");
      if (response.statusCode == 200) {
        // log("-------Body------${response.body}");
        return json.decode(response.body);
      } else {
        log("--------------statuscode-----${response.statusCode}");
        throw ErrorHandler(code: response.statusCode,message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 500);
    } on Exception catch (ex) {
      log("--------ex--------${ex}");
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 500);
    }
  }

  static Future<Movies> getRequest (String url) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return Movies.fromJson(json.decode(response.body));
      } else {
        throw ErrorHandler(code: response.statusCode ,message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 500);
    }
  }
}