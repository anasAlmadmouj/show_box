import 'package:show_box/core/app_imports/app_imports.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(
          id: json["id"],
          name: json["title"],
          backdropPath: json["backdrop_path"],
          overview: json["overview"],
          genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
          voteAverage: json["vote_average"].toDouble(),
          releaseDate: json["release_date"]
      );
}
