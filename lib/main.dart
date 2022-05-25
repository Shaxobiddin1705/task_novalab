import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_novalab/pages/history_facts_page.dart';
import 'package:task_novalab/pages/random_cat_fact_page.dart';
import 'package:task_novalab/services/hive_service.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveDB.DB_NAME);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomCatFactPage(),
      routes: {
        HistoryFactsPage.id: (context) => HistoryFactsPage(),
      },
    );
  }
}