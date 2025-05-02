import 'package:flutter_cinema/features/movies/data/models/actor/actor_model.dart';

/// Data model representing the response of actors for a specific movie.
///
/// This model is part of the data layer and should be mapped to an
/// [ActorResponseEntity] before being used in the domain or presentation layers.
class ActorResponseModel {
  List<ActorModel> actors;
  int id;

  ActorResponseModel({required this.id, required this.actors});

  /// Creates an [ActorResponseModel] instance from a JSON map.
  ///
  /// - Defaults `id` to `0` if null.
  /// - Maps the `cast` array from the JSON to a list of [ActorModel]s.
  factory ActorResponseModel.fromJson(Map<String, dynamic> json) =>
      ActorResponseModel(
        id: json['id'] ?? 0,
        actors: List<ActorModel>.from(
          json['cast'].map((actor) => ActorModel.fromJson(actor)),
        ),
      );
}
