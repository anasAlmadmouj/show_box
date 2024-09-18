import 'package:show_box/core/app_imports/app_imports.dart';

abstract class MoviesEvent extends Equatable{
 const MoviesEvent();

 @override
  List<Object> get props => [];
}

class NowPlayingMovieEvent extends MoviesEvent {}
class PopularMovieEvent extends MoviesEvent {}
class TopRatedMovieEvent extends MoviesEvent {}