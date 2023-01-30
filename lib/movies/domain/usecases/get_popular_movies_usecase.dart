import 'package:dartz/dartz.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/movies/domain/entites/movie_entity/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../../../core/errors/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure,List<Movie>>>call(NoParameters parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}