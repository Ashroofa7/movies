import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/core/utills/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movies_controller/movies_events.dart';
import 'package:movies/movies/presentation/controllers/movies_controller/movies_states.dart';

import '../../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesStates()) {

    on<GetNowPlayingMoviesEvent>((event, emit) async {

      await _get_now_playing_event(emit);
    });

    on<GetPopularMoviesEvent>((event, emit) async {

      await _get_popular_event(emit);
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      await _get_top_rated_event(emit);
    });
  }



  Future<void> _get_now_playing_event(Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _get_popular_event(Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _get_top_rated_event(Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }

}
