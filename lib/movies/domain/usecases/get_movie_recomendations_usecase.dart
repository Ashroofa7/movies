import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/movies/domain/entites/movie_details_entity/recommendations.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetMoviesRecommendationsUseCase extends BaseUseCase<List<Recommendations>,RecommendationParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationParameter parameters)async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}
class RecommendationParameter extends Equatable{
  final int id;

  const RecommendationParameter({required this.id});

  @override
  List<Object?> get props => [id,];
}