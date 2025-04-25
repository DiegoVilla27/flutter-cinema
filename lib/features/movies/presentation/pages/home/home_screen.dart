import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_widgets.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(_) {
    return Column(
      children: [
        const AppBarCustom(),
        const SizedBox(height: 20),
        const MoviesNowPlaying(),
      ],
    );
  }
}
