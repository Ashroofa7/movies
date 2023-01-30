import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String? backdropPath;
  final int id;

  const Recommendations({
     this.backdropPath,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
      ];
}
