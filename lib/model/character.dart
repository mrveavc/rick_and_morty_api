class Character {
  int id;
  String name;
  String status;
  String species;
  String gender;
  String origin;
  String location;
  String image;

  Character.fromMap(Map<String, dynamic> map)
      : id = map["id"] ?? 0,
        name = map["name"] ?? "",
        status = map["status"] ?? "",
        species = map["species"] ?? "",
        gender = map["gender"] ?? "",
        origin = map["origin"]?["name"] ?? "",
        location = map["location"]?["name"] ?? "",
        image = map["image"] ?? "";
}
