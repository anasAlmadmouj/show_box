import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/recommendation_tvs.dart';
import 'package:show_box/tvs/domain/repository/base_tvs_repository.dart';

class GetRecommendationTvsUseCase extends BaseUseCase<List<RecommendationTvs> , RecommendationTvsParameter>{
  BaseTvsRepository baseTvsRepository;
  GetRecommendationTvsUseCase(this.baseTvsRepository);
  @override
  Future<Either<Failure, List<RecommendationTvs>>> call(RecommendationTvsParameter parameter) async {
    return await baseTvsRepository.getRecommendation(parameter);
  }

}

class RecommendationTvsParameter extends Equatable{
  final int id;
  const RecommendationTvsParameter({required this.id});

  @override
  List<Object?> get props => [id,];
}