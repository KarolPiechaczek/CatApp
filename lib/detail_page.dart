
import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cat_service.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.catId});
  final String catId;

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  bool isCatLoaded = false;
  late ApiResult result;

  assignData() async {
    result = await locator<CatService>().getCatDetails(widget.catId);
    setState(() {
      isCatLoaded = true;
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
          title: const Text('Details'),
        ),
        body: !isCatLoaded
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : switch (result) {
                Success() => displayInfo(result as Success),
                Failure() => Center(
                    child: Text((result as Failure).errorMessage),
                  ),
              });
  }

  Widget displayInfo(Success success) {
    var positiveResult = success.result;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Details about cat:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(positiveResult.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Cat ID: ${positiveResult.id}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Cat URL: ${positiveResult.url}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Image Height: ${positiveResult.height}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Image Width: ${positiveResult.width}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Breed: ${positiveResult.breeds.isNotEmpty ? positiveResult.breeds.first.name : 'Unknown'}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Temperament: ${positiveResult.breeds.isNotEmpty ? positiveResult.breeds.first.temperament : 'Unknown'}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Fun Fact: ${positiveResult.breeds.isNotEmpty ? positiveResult.breeds.first.description : 'No description available'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
