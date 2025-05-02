/// Represents an actor entity in the domain layer.
///
/// This class encapsulates the essential data related to an actor,
/// such as their ID, name, and profile picture.
class ActorEntity {
  int id;
  String name;
  String? profilePath;

  ActorEntity({required this.id, required this.name, this.profilePath});
}
