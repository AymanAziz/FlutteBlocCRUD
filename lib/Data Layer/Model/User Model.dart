class UserModel {

  final int? id;
  final String name;
  final int age;

  UserModel(
      { this.id,
        required this.name,
        required this.age,
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "age": age};
}
