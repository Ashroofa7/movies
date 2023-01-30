import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecases/get_movie_details.dart';
import 'package:movies/movies/domain/usecases/get_movie_recomendations_usecase.dart';
import 'package:movies/movies/presentation/controllers/movie_details_controller/movie_details_event.dart';
import 'package:movies/movies/presentation/controllers/movie_details_controller/movie_details_states.dart';

import '../../../../core/utills/enums.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetails;
  final GetMoviesRecommendationsUseCase getMoviesRecommendationsUseCase;

  MovieDetailsBloc(this.getMovieDetails, this.getMoviesRecommendationsUseCase)
      : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      await _getMovieDetails(event, emit);
    });

    on<GetMovieRecommendation>((event, emit) async {
      await _getRecommendation(event, emit);

    });
  }

  _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsStates> emit) async {
    final result = await getMovieDetails(MovieDetailsParameters(
      movieId: event.id,
    ));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsStates: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsStates: RequestState.loaded,
        ),
      ),
    );
    print(result);
  }

  _getRecommendation(
      GetMovieRecommendation event, Emitter<MovieDetailsStates> emit) async {
    final result = await getMoviesRecommendationsUseCase(
      RecommendationParameter(
        id: event.id,
      ),
    );
    result.fold(
        (l) => emit(state.copyWith(
              recommendationsState: RequestState.error,
              recommendationsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              recommendations: r,
              recommendationsState: RequestState.loaded,
            )));
    print(result);
  }
}
