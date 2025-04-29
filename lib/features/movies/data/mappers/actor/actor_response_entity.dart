import 'package:flutter_cinema/features/movies/data/mappers/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/data/models/actor/actor_response_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_response_entity.dart';

class ActorResponseMapper {
  static ActorResponseEntity actorResponseModelToEntity(
    ActorResponseModel actorResponse,
  ) => ActorResponseEntity(
    id: actorResponse.id,
    actors:
        actorResponse.actors
            .map((actor) => ActorMapper.actorModelToEntity(actor))
            .toList(),
  );
}
