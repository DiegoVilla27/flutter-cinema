import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';

/// Abstract class defining the contract for a movies repository.
///
/// This class outlines the necessary methods that any repository
/// implementation should have to interact with movie data sources.
/// These methods are used for retrieving movie data such as currently
/// playing movies, popular movies, upcoming movies, top-rated movies,
/// detailed movie information, actors, and search results.
///
/// All methods return data in the form of domain entities or entities
/// wrapped in a `Future`, allowing for asynchronous retrieval of movie data.
///
/// Methods:
/// - `getMoviesNow`: Fetches the list of movies currently playing.
/// - `getMoviesPopular`: Fetches the list of popular movies.
/// - `getMoviesUpcoming`: Fetches the list of upcoming movies.
/// - `getMoviesTop`: Fetches the list of top-rated movies.
/// - `getMovieDetails`: Fetches detailed information about a specific movie.
/// - `getMovieActors`: Fetches a list of actors for a given movie.
/// - `getMoviesSearch`: Fetches a list of movies based on a search query.
abstract class MoviesRepository {
  /// Fetches the list of movies that are currently playing in theaters.
  ///
  /// This method retrieves a list of movies that are currently being shown
  /// in theaters, mapping the data to a domain entity for further use.
  ///
  /// [page] The page number for the paginated movie results.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  Future<MovieResponseEntity> getMoviesNow(int page);

  /// Fetches the list of popular movies.
  ///
  /// This method retrieves a list of movies that are currently popular,
  /// mapping the data to a domain entity for further use.
  ///
  /// [page] The page number for the paginated movie results.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  Future<MovieResponseEntity> getMoviesPopular(int page);

  /// Fetches the list of upcoming movies.
  ///
  /// This method retrieves a list of movies that are scheduled to be released
  /// in the future, mapping the data to a domain entity for further use.
  ///
  /// [page] The page number for the paginated movie results.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  Future<MovieResponseEntity> getMoviesUpcoming(int page);

  /// Fetches the list of top-rated movies.
  ///
  /// This method retrieves a list of movies that have received the highest ratings,
  /// mapping the data to a domain entity for further use.
  ///
  /// [page] The page number for the paginated movie results.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  Future<MovieResponseEntity> getMoviesTop(int page);

  /// Fetches the detailed information about a specific movie.
  ///
  /// This method retrieves the detailed data of a movie, including information such
  /// as title, genres, release date, overview, and other metadata.
  ///
  /// [idMovie] The unique identifier of the movie.
  ///
  /// Returns a [Future] containing a [DetailEntity] with the movie's detailed data.
  Future<DetailEntity> getMovieDetails(int idMovie);

  /// Fetches the list of actors for a specific movie.
  ///
  /// This method retrieves a list of actors associated with a movie, mapping
  /// the data to domain entities for further use.
  ///
  /// [idMovie] The unique identifier of the movie.
  ///
  /// Returns a [Future] containing a list of [ActorEntity] objects.
  Future<List<ActorEntity>> getMovieActors(int idMovie);

  /// Fetches a list of movies based on a search query.
  ///
  /// This method retrieves a list of movies that match the provided search query,
  /// mapping the data to a domain entity for further use.
  ///
  /// [query] The search query to filter movies.
  /// [page] The page number for the paginated movie results.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  Future<MovieResponseEntity> getMoviesSearch(String query, int page);
}
