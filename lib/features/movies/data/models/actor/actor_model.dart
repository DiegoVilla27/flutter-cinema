/// Data model representing an actor as received from the API.
///
/// This model belongs to the data layer and should be converted to an
/// [ActorEntity] via a mapper before being used in the domain layer.
class ActorModel {
  int id;
  String name;
  String? profilePath;

  ActorModel({required this.id, required this.name, this.profilePath});

  /// Creates an [ActorModel] instance from a JSON object.
  ///
  /// Handles missing fields by providing fallback default values:
  /// - Defaults `id` to `0` if null.
  /// - Defaults `name` to an empty string if null.
  /// - Defaults `profilePath` to an empty string if null (though it's declared nullable).
  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    profilePath: json['profile_path'] ?? '',
  );
}
