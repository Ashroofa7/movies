import 'package:movies/movies/domain/entites/movie_details_entity/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      backdropPath: json['backdrop_path']??'/72V1r1G8S87ELagVxjqAUdChMCt.jpg',
      id: json['id'],
    );
  }
}
