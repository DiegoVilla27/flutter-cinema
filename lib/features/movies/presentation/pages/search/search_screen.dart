import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_search/get_movies_search_by_page_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(moviesSearchNotifierProvider.notifier).loadMovies("Batman");
      }
    });
  }

  @override
  Widget build(_) {
    final searchAsync = ref.watch(moviesSearchNotifierProvider);

    return searchAsync.when(
      data: (searchResponse) {
        return ListView.builder(
          itemCount: searchResponse.results.length,
          itemBuilder: (context, index) {
            return Text(searchResponse.results[index].title);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) {
        return SizedBox();
      },
    );
  }
}
