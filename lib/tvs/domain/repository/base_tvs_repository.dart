import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/recommendation_tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs_detail.dart';
import 'package:show_box/tvs/domain/usecases/get_recommenation_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_tvs_details_usecase.dart';

abstract class BaseTvsRepository {
  Future<Either<Failure , List<Tvs>>> getNowPlaying();
  Future<Either<Failure , List<Tvs>>> getPopularTvs();
  Future<Either<Failure , List<Tvs>>> getTopRatedTvs();
  Future<Either<Failure , TvsDetail>> getTvsDetail(TvsDetailsParameter parameter);
  Future<Either<Failure , List<RecommendationTvs>>> getRecommendation(RecommendationTvsParameter parameter);
}