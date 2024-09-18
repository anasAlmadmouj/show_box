import 'package:show_box/core/app_imports/app_imports.dart';

class Recommendation extends Equatable {
  final String? backdropPath;
  final int id;

  const Recommendation({ this.backdropPath, required this.id});

  @override
  List<Object?> get props => [
        id,
        backdropPath,
      ];
}
