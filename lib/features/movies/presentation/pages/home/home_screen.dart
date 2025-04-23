import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/now_playing/movies_now_playing_widget.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(_) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarCustom(), 
          const SizedBox(height: 20),
          const MoviesNowPlaying()
        ]
      ),
    );
  }
}
