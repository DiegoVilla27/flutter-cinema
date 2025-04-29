class ActorModel {
  int id;
  String name;
  String? profilePath;

  ActorModel({required this.id, required this.name, this.profilePath});

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    profilePath: json['profile_path'] ?? '',
  );
}
