import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/usecases/get_recommenation_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_tvs_details_usecase.dart';
import 'package:show_box/tvs/presentation/controller/tvs_details_event.dart';
import 'package:show_box/tvs/presentation/controller/tvs_details_state.dart';

class TvsDetailsBloc extends Bloc<TvsDetailsEvent, TvsDetailsState> {
  final GetTvsDetailsUseCase getTvsDetailsUseCase;
  final GetRecommendationTvsUseCase getRecommendationTvsUseCase;

  TvsDetailsBloc(
    this.getTvsDetailsUseCase,
      this.getRecommendationTvsUseCase
  ) : super(const TvsDetailsState()) {
    on<GetTvsDetailsEvent>(_getMovieDetails);
    on<GetTvsRecommendEvent>(_getRecommendation);
  }

  static TvsDetailsBloc  get(context) => BlocProvider.of(context);

  FutureOr<void> _getMovieDetails(GetTvsDetailsEvent event, Emitter<TvsDetailsState> emit) async {
    final result = await getTvsDetailsUseCase(TvsDetailsParameter(id: event.id));
    result.fold(
          (l) => emit(
        state.copyWith(
            movieDetailsState: RequestState.error, movieDetailsMessage: l.message
        ),),
          (r) => emit(state.copyWith(
          movieDetailsState: RequestState.loaded, tvsDetails: r
      )),
    );
  }


  FutureOr<void> _getRecommendation(GetTvsRecommendEvent event, Emitter<TvsDetailsState> emit) async {
    final result = await getRecommendationTvsUseCase(RecommendationTvsParameter(id: event.id));
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
