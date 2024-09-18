import 'package:show_box/core/app_imports/app_imports.dart';
part 'fadein_now_playing.dart';
class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).appType == AppType.movies ?
    BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous.nowPlayingState != current.nowPlayingState,
        builder: (context, state) {
          switch(state.nowPlayingState){
          case RequestState.loading:
          return  SizedBox(
          height: 400.h,
          child: const Center(child: CircularProgressIndicator()),
          );
          case RequestState.loaded:
            return FadeInNowPlaying(nowPlayingList: state.nowPlayingMovie);
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(child: Text(state.nowPlayingMessage)),
            );
          }

        }
    )
        : BlocBuilder<TvsBloc, TvsState>(
        buildWhen: (previous, current) => previous.nowPlayingState != current.nowPlayingState,
        builder: (context, state) {
          switch(state.nowPlayingState){
            case RequestState.loading:
              return  SizedBox(
                height: 400.h,
                child: const Center(child: CircularProgressIndicator()),
              );
            case RequestState.loaded:
              return FadeInNowPlaying(nowPlayingList: state.nowPlayingTvs);
            case RequestState.error:
              return SizedBox(
                height: 400,
                child: Center(child: Text(state.nowPlayingMessage)),
              );
          }

        }
    );
  }
}
