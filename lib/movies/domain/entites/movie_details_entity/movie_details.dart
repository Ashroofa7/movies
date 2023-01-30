import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final String overview;
  final List<Genres> genres;

  const MovieDetails({
    required this.backdropPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
    required this.overview,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        title,
        releaseDate,
        voteAverage,
        runtime,
        overview,
        genres,
      ];
}
