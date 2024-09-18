import 'package:show_box/core/app_imports/app_imports.dart';

class MovieDetail extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final String overview;
  final List<Genres> genres;
  final double voteAverage;
  final String releaseDate;
  final int? runTime;

 const MovieDetail({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.overview,
    required this.genres,
    required this.voteAverage,
    required this.releaseDate,
     this.runTime,
  });

  @override
  List<Object?> get props => [
    id,
    releaseDate,
    voteAverage,
    runTime,
    name,
    genres,
    backdropPath,
    overview,
  ];
}
