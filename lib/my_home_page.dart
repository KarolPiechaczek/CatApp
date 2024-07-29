import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/get_my_row.dart';
import 'package:flutter/material.dart';
import 'cat_api_ask.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDataLoded = false;
  late ApiResult result;

  assignData() async {
    result = await getCats();
    setState(() {
      isDataLoded = true;
    });
  }

  @override
  void initState() {
    assignData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text(widget.title)),
        ),
        body: !isDataLoded
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : switch (result) {
                Success() => ListView.builder(
                    itemCount: (result as Success).result.length,
                    itemBuilder: (
                      context,
                      index,
                    ) =>
                        getMyRow(index, (result as Success), context),
                  ),
                Failure() => Center(
                    child: Text((result as Failure).errorMessage),
                  ),
              });
  }

}
