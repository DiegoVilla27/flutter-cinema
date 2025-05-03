import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/info/widgets/widgets.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movie_actors/get_movie_actors_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget that displays detailed information about a movie.
///
/// The `MovieInfo` widget takes a `DetailEntity` representing the movie and displays its information,
/// such as status, release date, genres, overview, and a list of actors. The widget fetches the actors' data
/// after being built, using a provider to load the actors by the movie's ID.
///
/// Parameters:
/// - [movie]: A `DetailEntity` object containing the detailed information of the movie,
/// including its status, release date, genres, overview, and actors.
///
/// Returns:
/// - A `Padding` widget containing a `Column` with multiple children: a `MovieDate` widget for displaying
/// the movie's status and release date, a `MovieGenres` widget for displaying the movie's genres,
/// a `Text` widget for displaying the movie's overview, and a `MovieActors` widget for displaying the actors.
class MovieInfo extends ConsumerStatefulWidget {
  final DetailEntity movie;

  const MovieInfo({super.key, required this.movie});

  @override
  ConsumerState<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends ConsumerState<MovieInfo> {
  @override
  void initState() {
    super.initState();

    /// Schedules a callback to load movie actors after the widget is rendered.
    ///
    /// This method schedules a task to load the actors associated with the movie
    /// after the widget has been fully built and rendered. The callback is executed
    /// once the current frame is completed to ensure the widget is properly rendered.
    ///
    /// The `mounted` check ensures that the callback is only executed if the widget
    /// is still part of the widget tree, preventing potential errors when the
    /// widget has been disposed of.
    ///
    /// The callback accesses the `movieActorsNotifierProvider` and invokes the
    /// `loadActors` method, passing the movie's ID to fetch the associated actors.
    ///
    /// This is useful for triggering actions like loading data after the widget
    /// has been displayed, ensuring that any network requests or heavy operations
    /// don't block the UI rendering process.
    ///
    /// - If the widget is still mounted, the callback triggers the loading of actors.
    /// - If the widget has been disposed of, the callback is skipped to avoid errors.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref
            .read(movieActorsNotifierProvider.notifier)
            .loadActors(widget.movie.id);
      }
    });
  }

  @override
  Widget build(_) {
    final actorsAsync = ref.watch(movieActorsNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDate(
            status: widget.movie.status,
            releaseDate: widget.movie.releaseDate,
          ),
          SizedBox(height: 10),
          MovieGenres(genres: widget.movie.genres),
          SizedBox(height: 10),
          Text(widget.movie.overview),
          SizedBox(height: 20),
          MovieActors(actorsAsync: actorsAsync),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
