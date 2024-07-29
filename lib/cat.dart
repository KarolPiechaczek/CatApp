import 'dart:convert';
import 'breed.dart';

Cat catFromJson(String str) => Cat.fromJson(json.decode(str));

List<Cat> catsFromJson(String str) => List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));

List<Breed> breedFromJson(String str) {
  try {
    return List<Breed>.from(json.decode(str).map((x) => Breed.fromJson(x)));
  } catch (e) {
    return [];
  }
}

class Cat {
    final String id;
    final String url;
    final List<Breed> breeds;
    final int width;
    final int height;

    Cat({
        required this.id,
        required this.url,
        required this.breeds,
        required this.width,
        required this.height,
    });

    factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        url: json["url"],
        breeds: json["breeds"] != null
            ? List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x)))
            : [],
        width: json["width"],
        height: json["height"],
    );
}
