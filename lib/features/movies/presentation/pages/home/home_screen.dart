import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_widgets.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_now/get_movies_now_by_page_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_popular/get_movies_popular_by_page_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_top/get_movies_top_by_page_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_upcoming/get_movies_upcoming_by_page_notifier.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
