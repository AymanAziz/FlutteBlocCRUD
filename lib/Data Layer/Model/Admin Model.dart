class AdminModel {

  final int? id;
  final String name;
  final int age;

  AdminModel(
      { this.id,
        required this.name,
        required this.age,
      });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "age": age};
}
