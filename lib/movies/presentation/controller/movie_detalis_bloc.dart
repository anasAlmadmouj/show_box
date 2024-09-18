import 'package:show_box/core/app_imports/app_imports.dart';

class MoviesDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MoviesDetailsBloc(
    this.getMovieDetailsUseCase,
      this.getRecommendationUseCase
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendEvent>(_getRecommendation);
  }
  static MoviesDetailsBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailsParameter(id: event.id));
    result.fold(
          (l) => emit(
        state.copyWith(
            movieDetailsState: RequestState.error, movieDetailsMessage: l.message
        ),),
          (r) => emit(state.copyWith(
          movieDetailsState: RequestState.loaded, movieDetails: r
      )),
    );
  }
  FutureOr<void> _getRecommendation(GetMoviesRecommendEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameter(id: event.id));
    result.fold(
          (l) => emit(
        state.copyWith(
            recommendationState: RequestState.error, recommendationMessage: l.message
        ),),
          (r) => emit(state.copyWith(
          recommendationState: RequestState.loaded, recommendation: r,
      )),
    );
  }
}
