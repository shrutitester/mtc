import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/stringConstants.dart';
import 'error-handler.dart';


class ApiHelper {
  static Future<Map<String, dynamic>> hitApi({api, callType, fieldsMap}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> returnMap = {};
    Map<String, String> header = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    debugPrint('input map: : ${fieldsMap.toString()}');
    var body = jsonEncode(fieldsMap);
    var response;
    if (callType == StringConstants.getCall) {
      response = await getResponse(api.trim(), header);
    } else if (callType == StringConstants.postCall) {
      response = await postResponse(api, header, body);
    } else if (callType == StringConstants.patchCall) {
      response = await patchResponse(api, header, body);
    } else {
      response = await deleteResponse(api, header);
    }

    debugPrint(response.statusCode.toString());
    debugPrint('response: ${response.body}');

    if (response.statusCode == 201 ||
        response.statusCode == 200 ||
        response.statusCode == 202) {
      try {
        final body = json.decode(response.body);
        returnMap['body'] = body;
        return returnMap;
      } catch (e) {
        debugPrint(e.toString());
        returnMap['exception'] = e.toString();
        return returnMap;
      }
    } else {
      returnMap['statusCode'] = response.statusCode;
      returnMap['error'] = ErrorHandler.getError(response.body);
      return returnMap;
    }
  }

  static getResponse(String api, header) async {
    return await http.get(Uri.parse(StringConstants.baseUrl + api),
        headers: header);
  }

  static deleteResponse(String api, header) async {
    return await http.get(Uri.parse(StringConstants.baseUrl + api),
        headers: header);
  }

  static postResponse(String api, header, bodyData) async {
    return await http.post(Uri.parse(StringConstants.baseUrl + api),
        headers: header, body: bodyData);
  }

  static patchResponse(String api, header, bodyData) async {
    return await http.patch(Uri.parse(StringConstants.baseUrl + api),
        headers: header, body: bodyData);
  }
}
