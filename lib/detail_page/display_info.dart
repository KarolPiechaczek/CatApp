import 'package:first_flutter_app/api_result.dart';
import 'package:flutter/material.dart';

Widget displayInfo(Success success) {
  var positiveResult = success.result;

  return Scrollbar(
    thumbVisibility: true,
    child: SingleChildScrollView(
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
