import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_cinema/shared/utils/numbers/format.dart';

class MovieHorizontalCard extends StatelessWidget {
  final MovieEntity movie;

  const MovieHorizontalCard({super.key, required this.movie});

  IconData _showStar(double rating) {
    if (rating < 3.5) {
      return Icons.star_outline;
    } else if (rating < 7) {
      return Icons.star_half;
    } else {
      return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.0,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
              height: 185,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: double.infinity,
                  height: 185,
                  color: Colors.black12,
                );
              },
            ),
          ),
          Tooltip(
            message: movie.title,
            child: Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          Row(
            children: [
              Icon(_showStar(movie.voteAverage), color: Colors.amber, size: 20),
              SizedBox(width: 4),
              Text(
                formatCurrency(movie.voteAverage, decimalDigits: 1),
                style: TextStyle(color: Colors.amber, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
