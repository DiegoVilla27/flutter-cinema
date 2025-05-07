import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/delegates/search/search_movie_delegate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A custom app bar widget for the Cinema application.
///
/// This widget provides a top bar with a movie icon, the "Cinema" title, and a search button
/// that navigates to the search screen. The app bar is designed to be flexible with spacing
/// and padding around its elements.
///
/// The main layout consists of:
/// - A movie icon on the left with a specific color.
/// - A "Cinema" text label with bold font weight and a moderate font size.
/// - A search icon button on the right that, when pressed, navigates to the search screen.
///
/// It is built using a `Row` widget that aligns the elements horizontally with a `Spacer`
/// widget between the title and the search button.
class AppBarCustom extends ConsumerWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 4.0,
        top: 4.0,
        bottom: 4.0,
      ),
      child: Row(
        children: [
          Icon(Icons.movie, color: Colors.deepPurpleAccent),
          SizedBox(width: 10.0),
          Text(
            "Cinema",
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed:
                () => showSearch(
                  context: context,
                  delegate: MovieSearchDelegate(ref: ref),
                ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
