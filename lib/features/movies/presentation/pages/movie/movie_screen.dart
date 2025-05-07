import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/appbar/appbar.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/info/info.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movie_detail/get_movie_detail_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Stateful widget that displays detailed information about a movie.
///
/// The `MovieScreen` widget is responsible for fetching and displaying detailed
/// information about a movie using its ID. It triggers the loading of the movie details
/// when the widget is initialized, and presents the movie data through the UI.
///
/// The movie details are fetched asynchronously using a state management provider,
/// and the widget reacts accordingly based on the loading, error, or successful data fetch state.
///
/// Parameters:
/// - [id]: The unique identifier of the movie whose details are to be displayed.
///
/// Returns:
/// - A `CustomScrollView` with a `MovieAppBar` and `MovieInfo` to display the movie details.
/// - A loading indicator while the data is being fetched.
/// - An empty widget if an error occurs during data fetching.
class MovieScreen extends ConsumerStatefulWidget {
  final int id;

  const MovieScreen({super.key, required this.id});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    /// Schedules a callback to load movie details after the widget is rendered.
    ///
    /// This method schedules a task to load the details associated with the movie
    /// after the widget has been fully built and rendered. The callback is executed
    /// once the current frame is completed to ensure the widget is properly rendered.
    ///
    /// The `mounted` check ensures that the callback is only executed if the widget
    /// is still part of the widget tree, preventing potential errors when the
    /// widget has been disposed of.
    ///
    /// The callback accesses the `movieDetailNotifierProvider` and invokes the
    /// `loadDetails` method, passing the movie's ID to fetch the associated details.
    ///
    /// This is useful for triggering actions like loading data after the widget
    /// has been displayed, ensuring that any network requests or heavy operations
    /// don't block the UI rendering process.
    ///
    /// - If the widget is still mounted, the callback triggers the loading of details.
    /// - If the widget has been disposed of, the callback is skipped to avoid errors.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(movieDetailNotifierProvider.notifier).loadDetails(widget.id);
      }
    });
  }

  @override
  Widget build(_) {
    final detailAsync = ref.watch(movieDetailNotifierProvider);

    return Scaffold(
      body: detailAsync.when(
        data: (movie) {
          return FadeIn(
            child: CustomScrollView(
              slivers: [
                MovieAppBar(movie: movie),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return MovieInfo(movie: movie);
                  }, childCount: 1),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) {
          return SizedBox();
        },
      ),
    );
  }
}
