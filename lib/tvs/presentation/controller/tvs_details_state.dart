import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/recommendation_tvs.dart';
import 'package:show_box/tvs/domain/entities/tvs_detail.dart';

class TvsDetailsState extends Equatable {
  final TvsDetail? tvsDetails;
  final RequestState tvsDetailsState;
  final String tvsDetailsMessage;
  final List<RecommendationTvs> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  const TvsDetailsState({
    this.tvsDetails,
    this.tvsDetailsState = RequestState.loading,
    this.tvsDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  TvsDetailsState copyWith({
    TvsDetail? tvsDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<RecommendationTvs>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return TvsDetailsState(
      tvsDetails: tvsDetails ?? this.tvsDetails,
      tvsDetailsState: movieDetailsState ?? tvsDetailsState,
      tvsDetailsMessage: movieDetailsMessage ?? tvsDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        tvsDetails,
        tvsDetailsState,
        tvsDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
