import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_widgets.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_now/get_movies_now_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_popular/get_movies_popular_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_top/get_movies_top_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_upcoming/get_movies_upcoming_notifier.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen widget that displays a scrolling list of movie sections, including "Now Playing", 
/// "Upcoming", "Popular", and "Top Rated" movie categories.
///
/// This widget uses multiple movie data providers (such as `moviesNowNotifierProvider`, 
/// `moviesPopularNotifierProvider`, etc.) to fetch and display the corresponding movie sections 
/// inside horizontally scrollable lists. The screen is wrapped inside a `CustomScrollView` with a 
/// floating app bar at the top that contains the custom title widget [AppBarCustom]. Each movie 
/// category is represented by a [MoviesHorizontal] widget, and the welcome section is displayed 
/// using the [MoviesWelcome] widget. The data is fetched asynchronously using Riverpod's state 
/// management system, reacting to changes in the data providers.
///
/// Parameters:
/// - None (the data is fetched using Riverpod state providers).
///
/// Returns:
/// - A [CustomScrollView] containing a floating app bar and a list of horizontally scrollable 
///   movie sections. Each movie section is dynamically updated based on the data from the 
///   respective providers (`moviesNowNotifierProvider`, `moviesUpcomingNotifierProvider`, 
///   `moviesPopularNotifierProvider`, `moviesTopNotifierProvider`).
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarBgColor = Theme.of(context).colorScheme.surface;
    final moviesNowAsync = ref.watch(moviesNowNotifierProvider);
    final moviesPopularAsync = ref.watch(moviesPopularNotifierProvider);
    final moviesUpcomingAsync = ref.watch(moviesUpcomingNotifierProvider);
    final moviesTopAsync = ref.watch(moviesTopNotifierProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: appBarBgColor,
          surfaceTintColor: appBarBgColor,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: ZoomIn(child: const AppBarCustom()),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                Column(
                  spacing: 20.0,
                  children: [
                    MoviesWelcome(moviesAsync: moviesNowAsync),
                    MoviesHorizontal(
                      title: 'Now Playing',
                      moviesAsync: moviesNowAsync,
                      provider: moviesNowNotifierProvider,
                    ),
                    MoviesHorizontal(
                      title: 'Upcoming',
                      moviesAsync: moviesUpcomingAsync,
                      provider: moviesUpcomingNotifierProvider,
                    ),
                    MoviesHorizontal(
                      title: 'Popular',
                      moviesAsync: moviesPopularAsync,
                      provider: moviesPopularNotifierProvider,
                    ),
                    MoviesHorizontal(
                      title: 'Top Rated',
                      moviesAsync: moviesTopAsync,
                      provider: moviesTopNotifierProvider,
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
