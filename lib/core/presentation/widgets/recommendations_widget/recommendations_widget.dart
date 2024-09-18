import 'package:show_box/core/app_imports/app_imports.dart';

class RecommendationsWidget extends StatelessWidget {
  const RecommendationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).appType == AppType.movies
        ? BlocBuilder<MoviesDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final recommendation = state.recommendation[index];
                return InkWell(
                  onTap: () => navigateTo(context, MovieDetailScreen(id: recommendation.id)),
                  child: CustomImageRecommendation(
                    imagePath: recommendation.backdropPath,
                  ),
                );
              },
              childCount: state.recommendation.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          );
        })
        : BlocBuilder<TvsDetailsBloc, TvsDetailsState>(
        builder: (context, state) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final recommendation = state.recommendation[index];
                return InkWell(
                  onTap: () => navigateTo(context, TvsDetailScreen(id: recommendation.id)),
                  child: CustomImageRecommendation(
                    imagePath: recommendation.backdropPath,
                  ),
                );
              },
              childCount: state.recommendation.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          );
        });
  }
}


