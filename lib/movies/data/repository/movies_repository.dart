import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/exceptions.dart';
import 'package:movies/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies/movies/domain/entites/movie_details_entity/recommendations.dart';
import 'package:movies/movies/domain/entites/movie_entity/movie.dart';
import 'package:movies/movies/domain/entites/movie_details_entity/movie_details.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_movie_recomendations_usecase.dart';

import '../../../core/errors/failure.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getPlayingNow() async {
    final result = await baseMoviesRemoteDataSource.getNowPlaying();

    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.Message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.Message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.Message),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.Message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(RecommendationParameter parameter) async{

    final result = await baseMoviesRemoteDataSource.getRecommendations(parameter);
    try{
      return Right(result);
    }on ServerExceptions catch (failure){
      return Left(
        ServerFailure(failure.errorMessageModel.Message),
      );
    }
  }



}
