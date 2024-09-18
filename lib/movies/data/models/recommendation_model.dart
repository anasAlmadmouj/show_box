import 'package:show_box/core/app_imports/app_imports.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) => RecommendationModel(
        backdropPath: json['backdrop_path'] ?? '/zIYROrkHJPYB3VTiW1L9QVgaQO.jpg',
        id: json['id'],
      );
}
