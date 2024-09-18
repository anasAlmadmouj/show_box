import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';
import 'package:show_box/tvs/domain/repository/base_tvs_repository.dart';

class GetPopularTvsUseCase extends BaseUseCase<List<Tvs> , NoParameter>{
  final BaseTvsRepository baseTvsRepository;

  GetPopularTvsUseCase(this.baseTvsRepository);

  @override
  Future<Either<Failure , List<Tvs>>> call(NoParameter parameter){
    return baseTvsRepository.getPopularTvs();
  }
}