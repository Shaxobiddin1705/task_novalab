import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_novalab/view_model/history_facts_view_model.dart';

class HistoryFactsPage extends StatefulWidget {
  HistoryFactsPage({Key? key}) : super(key: key);
  static const String id = "history_facts_page";

  @override
  State<HistoryFactsPage> createState() => _HistoryFactsPageState();
}

class _HistoryFactsPageState extends State<HistoryFactsPage> {
  var viewModel = HistoryFactsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
          create: (BuildContext context) => viewModel,
          child: Consumer<HistoryFactsViewModel>(
            builder: (context, index, model) => Center(
              child: Text('${viewModel.historyFacts} \n\n${viewModel.historyDates}'),
            ),
          ),
        ),
    );
  }
}
