import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies/movies_by_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(moviesNotifierProvider);
    final moviesNotifier = ref.read(moviesNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: moviesAsync.when(
            data:
                (movieResponse) => Column(
                  spacing: 10.0,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: movieResponse.results.length,
                        itemBuilder: (context, index) {
                          final movie = movieResponse.results[index];
                          return Column(
                            children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                child: Column(
                                  spacing: 10.0,
                                  children: [Image.network(movie.posterPath)],
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => moviesNotifier.changePage(1),
                          child: Text("Reset"),
                        ),
                        ElevatedButton(
                          onPressed:
                              () => moviesNotifier.changePage(
                                movieResponse.page + 1,
                              ),
                          child: Text("Next page"),
                        ),
                      ],
                    ),
                  ],
                ),
            loading: () => Center(child: const CircularProgressIndicator()),
            error: (error, _) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
