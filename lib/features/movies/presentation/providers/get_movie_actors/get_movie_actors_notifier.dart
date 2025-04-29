import 'dart:async';

import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movie_actors.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieActorsNotifierProvider =
    AsyncNotifierProvider.autoDispose<MovieActorsNotifier, List<ActorEntity>>(
      MovieActorsNotifier.new,
    );

class MovieActorsNotifier extends AutoDisposeAsyncNotifier<List<ActorEntity>> {
  int? _currentId;

  Future<List<ActorEntity>> _fetchActors(int idMovie) async {
    try {
      GetMovieActorsUseCase actorsUseCase = di<GetMovieActorsUseCase>();
      List<ActorEntity> actors = await actorsUseCase(idMovie);
      return Future.value(actors);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBarCustom.open(e.toString(), SnackbarType.error),
      );
      rethrow;
    }
  }

  Future<void> loadActors(int id) async {
    if (_currentId == id) return;
    _currentId = id;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchActors(id));
  }

  @override
  FutureOr<List<ActorEntity>> build() {
    return Future.error('No data loaded yet');
  }
}
