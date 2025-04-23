import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_now_playing/swiper/widgets/pagination/pagination.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_now_playing/swiper/widgets/swipe/swipe.dart';

class MoviesSwiper extends StatelessWidget {
  final List<MovieEntity> movies;

  const MoviesSwiper({super.key, required this.movies});

  @override
  Widget build(_) {
    return Swiper(
      viewportFraction: 0.75,
      scale: 0.8,
      autoplay: false,
      itemBuilder: (_, int index) => MovieSwipe(movie: movies[index]),
      itemCount: movies.length,
      pagination: swiperPagination(),
      control: SwiperControl(size: 0),
    );
  }
}
