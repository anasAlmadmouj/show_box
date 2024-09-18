import 'package:show_box/core/image_assets/image_assets.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';

class TvsModel extends Tvs {
  const TvsModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory TvsModel.fromJson(Map<String, dynamic> json) => TvsModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    backdropPath: json["backdrop_path"] ?? ImageAssets.logo, // Assuming you have a default image path
    overview: json["overview"] ?? '',
    genreIds: List<int>.from(json["genre_ids"]?.map((e) => e) ?? []),
    voteAverage: (json["vote_average"] ?? 0.0).toDouble(),
    releaseDate: json["first_air_date"] ?? '',
  );

}


