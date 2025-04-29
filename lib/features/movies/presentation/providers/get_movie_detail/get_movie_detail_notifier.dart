import 'dart:async';

import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movie_details.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailNotifierProvider =
    AsyncNotifierProvider.autoDispose<MovieDetailNotifier, DetailEntity>(
      MovieDetailNotifier.new,
    );

class MovieDetailNotifier extends AutoDisposeAsyncNotifier<DetailEntity> {
  int? _currentId;

  Future<DetailEntity> _fetchDetails(int idMovie) async {
    try {
      GetMovieDetailUseCase detailUseCase = di<GetMovieDetailUseCase>();
      DetailEntity detail = await detailUseCase(idMovie);
      return Future.value(detail);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBarCustom.open(e.toString(), SnackbarType.error),
      );
      rethrow;
    }
  }

  Future<void> loadDetails(int id) async {
    if (_currentId == id) return;
    _currentId = id;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchDetails(id));
  }

  @override
  FutureOr<DetailEntity> build() {
    return Future.error('No data loaded yet');
  }
}
