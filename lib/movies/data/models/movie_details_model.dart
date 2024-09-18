import 'package:show_box/core/app_imports/app_imports.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.overview,
    required super.genres,
    required super.voteAverage,
    required super.releaseDate,
     super.runTime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
        id: json['id'],
        name: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        runTime: json['run_time'] ?? 0,
      );
}
