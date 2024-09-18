import 'package:show_box/core/app_imports/app_imports.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie> , NoParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure , List<Movie>>> call(NoParameter parameter){
    return baseMoviesRepository.getPopularMovies();
  }
}