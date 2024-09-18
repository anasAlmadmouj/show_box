import 'package:show_box/core/app_imports/app_imports.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<NowPlayingMovieEvent>(_getNowPlaying);
    on<PopularMovieEvent>(_getPopular);

    on<TopRatedMovieEvent>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(NowPlayingMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameter());
    result.fold(
          (l) => emit(
        state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message
        ),),
          (r) => emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovie: r
      )),
    );
  }

  FutureOr<void> _getPopular(PopularMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
          (l) => emit(
        state.copyWith(
            popularState: RequestState.error , popularMessage: l.message
        ),
      ),
          (r) => emit(
        state.copyWith(
          popularMovie: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRated(TopRatedMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    result.fold(
            (l) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          ),
        ),
            (r) => emit(
            state.copyWith(
                topRatedMovie: r,
                topRatedState: RequestState.loaded
            )
        )
    );
  }
}
