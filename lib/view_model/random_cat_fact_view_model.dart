import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart' as provider;
import 'package:http/http.dart';
import 'package:task_novalab/models/random_cat_fact_model.dart';
import 'package:task_novalab/services/hive_service.dart';
import 'package:task_novalab/services/http_service.dart';

class RandomCatFactViewModel extends provider.ChangeNotifier{
  String? randomFact;
  DateTime? randomFactDate;
  String? imageUrl;
  bool isLoading = false;

  Future<void> getRandomCatFact() async{
    isLoading = true;
    notifyListeners();

    Network.GET(Network.API_RANDOM_CAT_FACT, Network.paramsEmpty()).then((value) async {
      if(value != null) {
        randomFact = randomCatFactFromJson(value).text;
        notifyListeners();
        randomFactDate = DateTime.parse(randomCatFactFromJson(value).createdAt!);
        notifyListeners();
        // var result = await get(Uri.parse('https://cataas.com/cat'));
        // log(result.body);
        imageUrl = MultipartRequest('POST', Uri.parse('https://cataas.com/cat')).url.toString();
        notifyListeners();
        HiveDB.storeFacts(randomCatFactFromJson(value));
        log('Successfully stored');
      }
      isLoading = false;
      notifyListeners();
    });

  }
}