import 'package:show_box/core/app_imports/app_imports.dart';

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({required this.id , required this.name});

  @override
  List<Object?> get props => [id,name];
}