import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/data/datasource/tvs_remote_datasource.dart';
import 'package:show_box/tvs/data/models/tvs_model.dart';
import 'package:show_box/tvs/domain/entities/recommendation_tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs_detail.dart';
import 'package:show_box/tvs/domain/repository/base_tvs_repository.dart';
import 'package:show_box/tvs/domain/usecases/get_recommenation_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_tvs_details_usecase.dart';

class TvsRepository extends BaseTvsRepository {
  final BaseTvsRemoteDataSource baseTvsRemoteDataSource;
   TvsRepository(this.baseTvsRemoteDataSource);
  @override
  Future<Either<Failure , List<TvsModel>>> getNowPlaying() async {
    final result = await baseTvsRemoteDataSource.getNowPlayingTvs();
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getPopularTvs() async {
    final result = await baseTvsRemoteDataSource.getNowPopularTvs();
    print(result);
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getTopRatedTvs() async {
    final result = await baseTvsRemoteDataSource.getTopRatedTvs();
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvsDetail>> getTvsDetail(TvsDetailsParameter parameter) async {
    final result = await baseTvsRemoteDataSource.getTvsDetails(parameter);
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationTvs>>> getRecommendation(RecommendationTvsParameter parameter) async {
    final result = await baseTvsRemoteDataSource.getTvsRecommendation(parameter);
    try{
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}