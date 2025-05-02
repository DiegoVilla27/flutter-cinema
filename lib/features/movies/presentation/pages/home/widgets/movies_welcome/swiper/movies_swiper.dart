import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_welcome/swiper/widgets/pagination/pagination.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_welcome/swiper/widgets/swipe/swipe.dart';

/// A stateless widget that displays a horizontally scrollable movie carousel using the Swiper package.
///
/// This widget is typically used to display a collection of movie backdrops in a swipeable carousel.
/// It utilizes the [Swiper] widget to enable smooth horizontal scrolling with custom settings like
/// viewport fraction, scale, autoplay, and pagination. Each item in the carousel represents a movie, 
/// and the [MovieSwipe] widget is used to display each movie's backdrop image.
///
/// Parameters:
/// - [movies]: A list of [MovieEntity] objects, each representing a movie with a backdrop image.
///
/// Returns:
/// - A [Swiper] widget that displays a horizontally scrollable carousel of movie backdrops, with
///   pagination and swipe controls.
class MoviesSwiper extends StatelessWidget {
  final List<MovieEntity> movies;

  const MoviesSwiper({super.key, required this.movies});

  @override
  Widget build(_) {
    return Swiper(
      viewportFraction: 0.75,
      scale: 0.8,
      autoplay: false,
      loop: true,
      autoplayDelay: 3000,
      itemBuilder: (_, int index) => MovieSwipe(movie: movies[index]),
      itemCount: movies.length,
      pagination: swiperPagination(),
      control: SwiperControl(size: 0),
    );
  }
}
