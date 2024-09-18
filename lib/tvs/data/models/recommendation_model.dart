import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/recommendation_tvs.dart';

class RecommendationTvsModel extends RecommendationTvs {
  const RecommendationTvsModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationTvsModel.fromJson(Map<String, dynamic> json) => RecommendationTvsModel(
        backdropPath: json['backdrop_path'] ?? '/zIYROrkHJPYB3VTiW1L9QVgaQO.jpg',
        id: json['id'],
      );
}
