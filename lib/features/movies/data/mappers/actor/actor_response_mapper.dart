import 'package:flutter_cinema/features/movies/data/mappers/actor/actor_mapper.dart';
import 'package:flutter_cinema/features/movies/data/models/actor/actor_response_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_response_entity.dart';

/// A utility class responsible for converting [ActorResponseModel] instances
/// into domain-level [ActorResponseEntity] objects.
class ActorResponseMapper {
  /// Maps an [ActorResponseModel] to an [ActorResponseEntity].
  ///
  /// This function transforms the entire actor response from the data layer
  /// into a format that can be used within the domain layer.
  ///
  /// - Converts each [ActorModel] in the list to an [ActorEntity] using [ActorMapper].
  ///
  /// Parameters:
  /// - [actorResponse]: The response model received from the API.
  ///
  /// Returns:
  /// - An [ActorResponseEntity] that contains the response ID and a list of actor entities.
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
