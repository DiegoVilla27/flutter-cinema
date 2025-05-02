import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A custom app bar widget designed for movie detail screens, featuring a large header
/// with the movie title and a backdrop poster image.
///
/// This app bar is implemented as a `SliverAppBar` to allow for scrolling and expansion/collapse
/// behavior. The title is displayed in the center of the app bar, and the background image (poster)
/// of the movie is shown with a parallax effect as the user scrolls. A gradient overlay is applied
/// to the background image to improve the readability of the title. Additionally, a floating action
/// button is positioned in the top-left corner for navigation (typically to go back to the previous screen).
///
/// Parameters:
/// - [title]: The title of the movie to be displayed in the app bar.
/// - [posterPath]: The URL of the movie's poster image to be displayed as the background.
///
/// Returns:
/// - A `SliverAppBar` widget with a flexible space that contains the movie title, backdrop poster,
///   and a floating action button for navigation.
class MovieAppBar extends StatelessWidget {
  final String title;
  final String posterPath;

  const MovieAppBar({super.key, required this.title, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.45,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            background: Stack(
              children: [
                SizedBox.expand(
                  child: Image.network(posterPath, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1.0],
                        colors: [Colors.transparent, Colors.black],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: FloatingActionButton(
              onPressed: () => context.pop(),
              mini: true,
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(Icons.chevron_left),
            ),
          ),
        ],
      ),
    );
  }
}
