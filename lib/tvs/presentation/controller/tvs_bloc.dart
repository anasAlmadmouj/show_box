import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/usecases/get_now_playing_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:show_box/tvs/presentation/controller/tvs_event.dart';
import 'package:show_box/tvs/presentation/controller/tvs_state.dart';

class TvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetNowPlayingTvsUseCase getNowPlayingTvsUseCase;
  final GetPopularTvsUseCase getPopularTvsUseCase;
  final GetTopRatedTvsUseCase getTopRatedTvsUseCase;

  TvsBloc(
    this.getNowPlayingTvsUseCase,
    this.getPopularTvsUseCase,
    this.getTopRatedTvsUseCase,
  ) : super(const TvsState()) {
    on<NowPlayingTvsEvent>(_getNowPlaying);
    on<PopularTvsEvent>(_getPopular);

    on<TopRatedTvsEvent>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(NowPlayingTvsEvent event, Emitter<TvsState> emit) async {
    final result = await getNowPlayingTvsUseCase(const NoParameter());
    result.fold(
          (l) => emit(
        state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message
        ),),
          (r) => emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingTvs: r
      )),
    );
  }

  FutureOr<void> _getPopular(PopularTvsEvent event, Emitter<TvsState> emit) async {
    final result = await getPopularTvsUseCase(const NoParameter());
    result.fold(
          (l) => emit(
        state.copyWith(
            popularState: RequestState.error , popularMessage: l.message
        ),
      ),
          (r) => emit(
        state.copyWith(
          popularTvs: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRated(TopRatedTvsEvent event, Emitter<TvsState> emit) async {
    final result = await getTopRatedTvsUseCase(const NoParameter());
    result.fold(
            (l) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          ),
        ),
            (r) => emit(
            state.copyWith(
                topRatedTvs: r,
                topRatedState: RequestState.loaded
            )
        )
    );
  }
}
