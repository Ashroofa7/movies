import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entites/movie_details_entity/recommendations.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_movie_recomendations_usecase.dart';

import '../../../core/errors/failure.dart';
import '../entites/movie_entity/movie.dart';
import '../entites/movie_details_entity/movie_details.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getPlayingNow();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendations>>> getRecommendations(RecommendationParameter parameter);
}