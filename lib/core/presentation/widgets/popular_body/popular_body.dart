import 'package:show_box/core/app_imports/app_imports.dart';

class PopularBody extends StatelessWidget {
  const PopularBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).appType == AppType.movies ?
      BlocBuilder<MoviesBloc , MoviesState>(
        buildWhen: (previous, current) => previous.popularState != current.popularState,
        builder: (context, state){
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: BodyListItem(list: state.popularMovie),
          );

        }
    )
    : BlocBuilder<TvsBloc , TvsState>(
        buildWhen: (previous, current) => previous.popularState != current.popularState,
        builder: (context, state){
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: BodyListItem(list: state.popularTvs),
          );

        }
    );
  }
}
