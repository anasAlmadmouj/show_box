import 'package:show_box/core/app_imports/app_imports.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return  AppCubit.get(context).appType == AppType.movies ?
      BlocBuilder<MoviesBloc , MoviesState>(
        buildWhen: (previous, current) => previous.popularState != current.popularState,
        builder: (context, state) {
          return RequestState.RequestMessageWidget(state: state.popularState,
              message: state.popularMessage,
              widget:  HorizontalListWidget(
                list: state.popularMovie,
              ));
      }
    )
        : BlocBuilder<TvsBloc , TvsState>(
        buildWhen: (previous, current) => previous.popularState != current.popularState,
        builder: (context, state) {
          return RequestState.RequestMessageWidget(state: state.popularState,
              message: state.popularMessage,
              widget:  HorizontalListWidget(
                list: state.popularTvs,
              ));
        }
    );
  }
}

