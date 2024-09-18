import 'package:show_box/core/app_imports/app_imports.dart';

abstract class BaseUseCase<T , Parameter> {
  Future<Either<Failure,T>> call(Parameter parameter);
}

class NoParameter extends Equatable{
  const NoParameter();

  @override
  List<Object?> get props => [];
}