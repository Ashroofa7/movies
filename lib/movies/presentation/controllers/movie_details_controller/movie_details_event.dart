import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
  ];
}

class GetMovieRecommendation extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendation(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
  ];
}
