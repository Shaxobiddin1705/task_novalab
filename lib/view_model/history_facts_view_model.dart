
import 'package:flutter/foundation.dart';
import 'package:task_novalab/services/hive_service.dart';

class HistoryFactsViewModel extends ChangeNotifier{
  String? historyFacts;
  String? historyDates;

  Future<void> getHistory() async {
    var result = HiveDB.loadFacts();
    historyFacts = result.text;
    notifyListeners();

    historyDates = result.createdAt;
    notifyListeners();
  }
}