import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MoviesNotifierBase extends AsyncNotifier<MovieResponseEntity> {
  Future<void> nextPage();
}
