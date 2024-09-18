import 'package:show_box/core/app_imports/app_imports.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie> , NoParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) {
    return baseMoviesRepository.getNowPlaying();
  }




}