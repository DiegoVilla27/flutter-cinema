import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/delegates/widgets/movie/movie_delegate.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_search/get_movies_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A custom search delegate for searching movies using a search bar in Flutter.
///
/// This class extends [SearchDelegate] and is integrated with Riverpod's [WidgetRef]
/// to manage the movie search state.
///
/// It customizes the app bar, search input styling, and handles search actions,
/// results, and interactions with the search field.
class MovieSearchDelegate extends SearchDelegate {
  final WidgetRef ref;

  MovieSearchDelegate({required this.ref});

  /// Label displayed in the search text field.
  @override
  String? get searchFieldLabel => 'Search movies...';

  /// Style applied to the search text input.
  @override
  TextStyle? get searchFieldStyle =>
      TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  /// Customizes the appearance of the AppBar and input field.
  @override
  ThemeData appBarTheme(BuildContext context) {
    final baseTheme = Theme.of(context);
    final colorScheme = baseTheme.colorScheme;

    return baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      ),
    );
  }

  /// Builds the actions shown on the right side of the AppBar.
  /// Shows a clear button when the query is not empty.
  @override
  List<Widget>? buildActions(BuildContext context) => [
    if (query.isNotEmpty)
      ZoomIn(
        animate: query.isNotEmpty,
        child: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ),
  ];

  /// Builds the leading widget on the left of the AppBar.
  /// Typically used to go back from the search page.
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      query = '';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(moviesSearchNotifierProvider.notifier).resetMovies();
      });
      close(context, null);
    },
  );

  /// Builds the results based on the current query.
  /// Triggers loading of movies and displays them in a [ListView].
  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return SizedBox();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesSearchNotifierProvider.notifier).loadMovies(query);
    });

    return Consumer(
      builder: (context, ref, _) {
        final searchAsync = ref.watch(moviesSearchNotifierProvider);

        return searchAsync.when(
          data:
              (moviesResponse) => FadeIn(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16.0,
                  ),
                  child: ListView.builder(
                    itemCount: moviesResponse.results.length,
                    itemBuilder: (context, index) {
                      final movie = moviesResponse.results[index];
                      return ZoomIn(child: MovieDelegate(movie: movie));
                    },
                  ),
                ),
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => SizedBox(),
        );
      },
    );
  }

  /// Builds the suggestions shown while the user is typing.
  /// Currently returns an empty widget.
  @override
  Widget buildSuggestions(_) {
    return SizedBox();
  }
}
