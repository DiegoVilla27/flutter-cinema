import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/actor/actor_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';

/// A utility class responsible for converting [ActorModel] instances
/// into domain-level [ActorEntity] objects.
class ActorMapper {
  /// Maps an [ActorModel] to an [ActorEntity].
  ///
  /// This transformation is used to adapt data received from the API (data layer)
  /// into the format used by the domain layer ([ActorEntity]).
  ///
  /// - If the [profilePath] in the model is not empty, it prepends the base
  ///   image URL from [Environments.apiImages].
  /// - Otherwise, it assigns an empty string.
  ///
  /// Parameters:
  /// - [actor]: The model object to be converted.
  ///
  /// Returns:
  /// - An [ActorEntity] with transformed and domain-ready data.
  static ActorEntity actorModelToEntity(ActorModel actor) => ActorEntity(
    id: actor.id,
    name: actor.name,
    profilePath:
        (actor.profilePath != '')
            ? '${Environments.apiImages}/${actor.profilePath}'
            : '',
  );
}
