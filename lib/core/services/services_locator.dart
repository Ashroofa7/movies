import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_movie_recomendations_usecase.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movie_details_controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controllers/movies_controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_movie_details.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //bloc
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    //UseCase
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => GetMoviesRecommendationsUseCase(sl()),
    );
    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );
    //Data Source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
