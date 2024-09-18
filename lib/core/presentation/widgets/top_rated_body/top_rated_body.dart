import 'package:show_box/core/app_imports/app_imports.dart';

class TopRatedBody extends StatelessWidget {
  const TopRatedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).appType == AppType.movies ?
      BlocBuilder<MoviesBloc , MoviesState>(
        buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,
        builder: (context, state){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FadeIn(
              duration: const Duration(milliseconds: 500),
              child: BodyListItem(list: state.topRatedMovie),
            ),
          );

        }
    )
    : BlocBuilder<TvsBloc , TvsState>(
        buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,
        builder: (context, state){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FadeIn(
              duration: const Duration(milliseconds: 500),
              child: BodyListItem(list: state.topRatedTvs),
            ),
          );

        }
    );
  }
}
