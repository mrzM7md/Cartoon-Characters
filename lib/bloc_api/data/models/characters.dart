class Character {
  late int charId;
  late String name, species, image, type, createdAt;

  Character.fromJson(Map<String, dynamic> json){
    charId = json['id'];
    name = json['name'];
    species = json['species'];
    image = json['image'];
    type = json['type'];
    createdAt = json['created'];
  }

}

