
import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_novalab/models/random_cat_fact_model.dart';

class Network {
  static String BASE = "cat-fact.herokuapp.com";
  static String baseUrlImage = 'cataas.com';
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_RANDOM_CAT_FACT = "/facts/random";
  static String API_RANDOM_CAT_IMAGE = '/cat';

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> getImage(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrlImage, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }
}