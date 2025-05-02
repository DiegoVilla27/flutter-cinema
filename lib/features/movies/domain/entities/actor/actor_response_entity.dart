import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';

/// Represents a response entity containing a list of actors.
///
/// This class encapsulates the response data when fetching actors,
/// including the list of actors and the associated ID (e.g., movie ID).
class ActorResponseEntity {
  List<ActorEntity> actors;
  int id;

  ActorResponseEntity({required this.id, required this.actors});
}