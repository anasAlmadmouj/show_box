import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/data/models/recommendation_model.dart';
import 'package:show_box/tvs/data/models/tvs_details_model.dart';
import 'package:show_box/tvs/data/models/tvs_model.dart';
import 'package:show_box/tvs/domain/entities/recommendation_tvs.dart';
import 'package:show_box/tvs/domain/usecases/get_recommenation_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_tvs_details_usecase.dart';

abstract class BaseTvsRemoteDataSource{
  Future<List<TvsModel>> getNowPlayingTvs();
  Future<List<TvsModel>> getNowPopularTvs();
  Future<List<TvsModel>> getTopRatedTvs();
  Future<TvsDetailsModel> getTvsDetails(TvsDetailsParameter parameter);
  Future<List<RecommendationTvs>> getTvsRecommendation(RecommendationTvsParameter parameter);
}
class TvsRemoteDataSource extends BaseTvsRemoteDataSource {
  @override
 Future<List<TvsModel>> getNowPlayingTvs() async {
   final response = await Dio().get(ApiConstants.tvNowPlayingPath);
   if(response.statusCode == 200){
     return List<TvsModel>.from((response.data['results'] as List).map((e) => TvsModel.fromJson(e)));
   }
   else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }
 }

  @override
  Future<List<TvsModel>> getNowPopularTvs() async {
    final response = await Dio().get(ApiConstants.tvPopularPath);
    if(response.statusCode == 200){
      return List<TvsModel>.from((response.data['results'] as List).map((e) => TvsModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvsModel>> getTopRatedTvs() async {
    final response = await Dio().get(ApiConstants.tvTopRatedPath);
    if(response.statusCode == 200){
      return List<TvsModel>.from((response.data['results'] as List).map((e) => TvsModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvsDetailsModel> getTvsDetails(TvsDetailsParameter parameter) async {
    final response = await Dio().get(ApiConstants.tvsDetailsPath(parameter.id));
    if(response.statusCode == 200){
      return TvsDetailsModel.fromJson(response.data);
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationTvs>> getTvsRecommendation(RecommendationTvsParameter parameter) async {
    final response = await Dio().get(ApiConstants.recommendationTvPath(parameter.id));
    if(response.statusCode == 200){
      return List<RecommendationTvsModel>.from((response.data['results'] as List).map((e) => RecommendationTvsModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}