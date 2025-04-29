import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/actor/actor_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';

class ActorMapper {
  static ActorEntity actorModelToEntity(ActorModel actor) => ActorEntity(
    id: actor.id,
    name: actor.name,
    profilePath:
        (actor.profilePath != '')
            ? '${Environments.apiImages}/${actor.profilePath}'
            : '',
  );
}
