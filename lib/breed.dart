
class Breed {
    final String id;
    final String name;
    final String temperament;
    final String description;

    Breed({
        required this.id,
        required this.name,
        required this.temperament,
        required this.description,
    });

    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        id: json["id"],
        name: json["name"],
        temperament: json["temperament"],
        description: json["description"],
    );
}