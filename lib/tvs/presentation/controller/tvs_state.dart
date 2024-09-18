import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/tvs/domain/entities/tvs.dart';

class TvsState extends Equatable {
  final List<Tvs> nowPlayingTvs;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Tvs> popularTvs;
  final RequestState popularState;
  final String popularMessage;
  final List<Tvs> topRatedTvs;
  final RequestState topRatedState;
  final String topRatedMessage;

  const TvsState({
    this.nowPlayingTvs = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularTvs = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTvs = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  TvsState copyWith({
    List<Tvs>? nowPlayingTvs,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Tvs>? popularTvs,
    RequestState? popularState,
    String? popularMessage,
    List<Tvs>? topRatedTvs,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return TvsState(
      nowPlayingTvs: nowPlayingTvs ?? this.nowPlayingTvs,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularTvs: popularTvs ?? this.popularTvs,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTvs: topRatedTvs ?? this.topRatedTvs,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingTvs,
        nowPlayingState,
        nowPlayingMessage,
        popularTvs,
        popularState,
        popularMessage,
        topRatedTvs,
        topRatedState,
        topRatedMessage,

      ];
}
