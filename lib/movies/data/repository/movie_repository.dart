import 'package:show_box/core/app_imports/app_imports.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
   MovieRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure , List<MovieModel>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPopularMovie();
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovie();
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailsParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameter);
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}