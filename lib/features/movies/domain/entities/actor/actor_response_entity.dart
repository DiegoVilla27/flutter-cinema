import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';

class ActorResponseEntity {
  List<ActorEntity> actors;
  int id;

  ActorResponseEntity({required this.id, required this.actors});
}
