import 'package:show_box/core/app_imports/app_imports.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure , List<Movie>>> getNowPlaying();
  Future<Either<Failure , List<Movie>>> getPopularMovies();
  Future<Either<Failure , List<Movie>>> getTopRatedMovies();
  Future<Either<Failure , MovieDetail>> getMovieDetail(MovieDetailsParameter parameter);
  Future<Either<Failure , List<Recommendation>>> getRecommendation(RecommendationParameter parameter);
}