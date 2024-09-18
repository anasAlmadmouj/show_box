import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/core/image_assets/image_assets.dart';
import 'package:show_box/tvs/domain/entities/tvs_detail.dart';

class TvsDetailsModel extends TvsDetail {
  const TvsDetailsModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.overview,
    required super.genres,
    required super.voteAverage,
    required super.releaseDate,
     super.runTime,
  });

  factory TvsDetailsModel.fromJson(Map<String, dynamic> json) => TvsDetailsModel(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    backdropPath: json['backdrop_path'] ?? ImageAssets.logo, // Use a default image if null
    overview: json['overview'] ?? '',
    genres: List<GenresModel>.from(
        json['genres']?.map((e) => GenresModel.fromJson(e)) ?? []),
    voteAverage: (json['vote_average'] ?? 0.0).toDouble(),
    releaseDate: json['release_date'] ?? '',
    runTime: json['run_time'] ?? 0,
  );

}
