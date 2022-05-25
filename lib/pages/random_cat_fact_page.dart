import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:task_novalab/pages/history_facts_page.dart';
import 'package:task_novalab/view_model/random_cat_fact_view_model.dart';

class RandomCatFactPage extends StatefulWidget {
  const RandomCatFactPage({Key? key}) : super(key: key);

  @override
  State<RandomCatFactPage> createState() => _RandomCatFactPageState();
}

class _RandomCatFactPageState extends State<RandomCatFactPage> {
  var viewModel = RandomCatFactViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getRandomCatFact();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => viewModel,
        child: Consumer<RandomCatFactViewModel>(
          builder: (context, index, model) => SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !viewModel.isLoading ? Center(
                    child: Text('${viewModel.randomFact!} \n\n${viewModel.randomFactDate!.toLocal()}'),
                  ) : const CircularProgressIndicator(),

                  const SizedBox(height: 20,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: !viewModel.isLoading ? Image.network(viewModel.imageUrl!, fit: BoxFit.contain,) : SizedBox.shrink(),
                  ),

                  const SizedBox(height: 20,),

                  MaterialButton(
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.blue,
                    onPressed: (){
                      viewModel.getRandomCatFact();
                    },
                    child: const Text('Another fact!'),
                  ),

                  const SizedBox(height: 20,),

                  MaterialButton(
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.blue,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryFactsPage()));
                    },
                    child: const Text('History Facts'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
