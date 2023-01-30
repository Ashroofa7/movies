import 'package:dio/dio.dart';
import 'package:movies/core/errors/exceptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/models/movie_details_model/recommendations_model.dart';
import 'package:movies/movies/data/models/movie_model/movies_model.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_movie_recomendations_usecase.dart';

import '../models/movie_details_model/movie_details_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationParameter parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final respose = await Dio().get(
      ApiConstance.nowPlayingMoviesPath,
    );
    if (respose.statusCode == 200) {
      return List<MovieModel>.from(
        (respose.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          respose.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final respose = await Dio().get(
      ApiConstance.popularMoviesPath,
    );
    if (respose.statusCode == 200) {
      return List<MovieModel>.from(
        (respose.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          respose.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final respose = await Dio().get(
      ApiConstance.topRatedMoviesPath,
    );
    if (respose.statusCode == 200) {
      return List<MovieModel>.from(
        (respose.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          respose.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
      ApiConstance.getMovieDetails(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationParameter parameters) async {
    final response = await Dio().get(
      ApiConstance.getRecommendations(parameters.id),
    );
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
          (response.data['results'] as List).map(
        (e) => RecommendationsModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
