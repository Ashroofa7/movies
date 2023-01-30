import 'package:movies/movies/domain/entites/movie_details_entity/movie_details.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.runtime,
    required super.overview,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      title: json['title'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      runtime: json['runtime'],
      overview: json['overview'],
      genres: List<GenresModel>.from(
        json['genres'].map(
          (e) => GenresModel.fromJson(e),
        ),
      ),
    );
  }
}
