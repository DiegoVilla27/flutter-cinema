import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_widgets.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_now/get_movies_now_by_page_notifier.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarBgColor = Theme.of(context).colorScheme.surface;
    final moviesAsync = ref.watch(moviesNowNotifierProvider);

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
                    MoviesWelcome(moviesAsync: moviesAsync),
                    MoviesHorizontal(
                      title: 'Now Playing',
                      moviesAsync: moviesAsync,
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
