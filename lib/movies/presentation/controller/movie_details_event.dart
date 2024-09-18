import 'package:show_box/core/app_imports/app_imports.dart';

abstract class MovieDetailsEvent extends Equatable{
 const MovieDetailsEvent();

 @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
 final int id;
 const GetMovieDetailsEvent(this.id);
 @override
 List<Object> get props => [id];
}
class GetMoviesRecommendEvent extends MovieDetailsEvent {
 final int id;
 const GetMoviesRecommendEvent({required this.id});
 @override
 List<Object> get props => [id];
}