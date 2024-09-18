import 'package:show_box/core/app_imports/app_imports.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail , MovieDetailsParameter>{
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameter parameter) async {
    return await baseMoviesRepository.getMovieDetail(parameter);
  }

}

class MovieDetailsParameter extends Equatable{
  final int id;
  const MovieDetailsParameter({required this.id});

  @override
  List<Object?> get props => [id];

}