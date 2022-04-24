class AprilModel {

  final int? id;
  final String name;
  final int day;

  AprilModel(
      { this.id,
        required this.name,
        required this.day,
       });

  factory AprilModel.fromJson(Map<String, dynamic> json) {
    return AprilModel(
        id: json["id"],
        name: json["name"],
        day: json["day"],
       );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "day": day};
}
