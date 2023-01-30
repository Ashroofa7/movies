import 'package:dartz/dartz.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../../../core/errors/failure.dart';
import '../entites/movie_entity/movie.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;


  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>>call(NoParameters parameters)async{
    return await baseMoviesRepository.getPlayingNow();
  }
}