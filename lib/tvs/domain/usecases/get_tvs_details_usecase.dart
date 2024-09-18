import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/tvs_detail.dart';
import 'package:show_box/tvs/domain/repository/base_tvs_repository.dart';

class GetTvsDetailsUseCase extends BaseUseCase<TvsDetail , TvsDetailsParameter>{
  BaseTvsRepository baseTvsRepository;
  GetTvsDetailsUseCase(this.baseTvsRepository);
  @override
  Future<Either<Failure, TvsDetail>> call(TvsDetailsParameter parameter) async {
    return await baseTvsRepository.getTvsDetail(parameter);
  }

}

class TvsDetailsParameter extends Equatable{
  final int id;
  const TvsDetailsParameter({required this.id});

  @override
  List<Object?> get props => [id];

}