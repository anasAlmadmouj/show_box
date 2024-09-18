import 'package:show_box/core/app_imports/app_imports.dart';

class Movie extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        id,
        name,
        backdropPath,
        overview,
        genreIds,
        voteAverage,
        releaseDate,
      ];


}
