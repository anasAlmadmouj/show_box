import 'package:show_box/core/app_imports/app_imports.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getNowPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);
  Future<List<Recommendation>> getRecommendation(RecommendationParameter parameter);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
 Future<List<MovieModel>> getNowPlayingMovie() async {
   final response = await Dio().get(ApiConstants.movieNowPlayingPath);
   if(response.statusCode == 200){
     return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
   }
   else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }
 }

  @override
  Future<List<MovieModel>> getNowPopularMovie() async {
    final response = await Dio().get(ApiConstants.moviePopularPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(ApiConstants.movieTopRatedPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter) async {
    final response = await Dio().get(ApiConstants.movieDetailsPath(parameter.id));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getRecommendation(RecommendationParameter parameter) async {
    final response = await Dio().get(ApiConstants.recommendationPath(parameter.id));
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data['results'] as List).map((e) => RecommendationModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}