import 'package:show_box/core/app_imports/app_imports.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return  AppCubit.get(context).appType == AppType.movies ?
    BlocBuilder<MoviesBloc , MoviesState>(
        buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,
        builder: (context, state){
          return RequestState.RequestMessageWidget(state: state.topRatedState,
              message: state.topRatedMessage,
              widget:  HorizontalListWidget(
                list: state.topRatedMovie,
              ));

      }
    )
        : BlocBuilder<TvsBloc , TvsState>(
        buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,
        builder: (context, state){
          return RequestState.RequestMessageWidget(state: state.topRatedState,
              message: state.topRatedMessage,
              widget:  HorizontalListWidget(
                list: state.topRatedTvs,
              ));

        }
    );
  }
}
