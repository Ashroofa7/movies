import 'package:equatable/equatable.dart';
import 'package:movies/core/utills/enums.dart';
import 'package:movies/movies/domain/entites/movie_details_entity/recommendations.dart';
import '../../../domain/entites/movie_details_entity/movie_details.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsStates;
  final String movieDetailsMessage;
  final List<Recommendations> recommendations;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const MovieDetailsStates({
    this.movieDetails,
    this.movieDetailsStates = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsStates,
    String? movieDetailsMessage,
    List<Recommendations>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MovieDetailsStates(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsStates: movieDetailsStates ?? this.movieDetailsStates,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage: recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsStates,
        movieDetailsMessage,
        recommendations,
        recommendationsState,
        recommendationsMessage,
      ];
}
