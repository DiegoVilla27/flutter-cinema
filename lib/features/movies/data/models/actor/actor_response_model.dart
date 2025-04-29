import 'package:flutter_cinema/features/movies/data/models/actor/actor_model.dart';

class ActorResponseModel {
  List<ActorModel> actors;
  int id;

  ActorResponseModel({required this.id, required this.actors});

  factory ActorResponseModel.fromJson(Map<String, dynamic> json) =>
      ActorResponseModel(
        id: json['id'] ?? 0,
        actors: List<ActorModel>.from(
          json['cast'].map((actor) => ActorModel.fromJson(actor)),
        ),
      );
}
