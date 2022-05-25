
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:task_novalab/models/random_cat_fact_model.dart';


class HiveDB{
  static String DB_NAME = "random_cat_fact";
  static var box = Hive.box(DB_NAME);

  static void storeFacts(RandomCatFact facts) async{
    box.put("facts", randomCatFactToJson(facts));
  }

  static RandomCatFact loadFacts() {
    var fact = randomCatFactFromJson(box.get("facts"));
    return fact;
  }
}