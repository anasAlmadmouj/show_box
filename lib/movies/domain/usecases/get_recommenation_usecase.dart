import 'package:show_box/core/app_imports/app_imports.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation> , RecommendationParameter>{
  BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameter) async {
    return await baseMoviesRepository.getRecommendation(parameter);
  }

}

class RecommendationParameter extends Equatable{
  final int id;
  const RecommendationParameter({required this.id});

  @override
  List<Object?> get props => [id,];
}