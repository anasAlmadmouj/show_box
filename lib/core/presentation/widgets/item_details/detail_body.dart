import 'package:show_box/core/app_imports/app_imports.dart';
part 'more_like_widget.dart';
part 'details_widget.dart';
class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).appType == AppType.movies ?
      BlocBuilder<MoviesDetailsBloc , MovieDetailsState>(
      builder: (context, state) {
        switch(state.movieDetailsState){
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator(),);
          case RequestState.loaded:
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                AppBarDetails(state: state),
                DetailsWidget(state: state),
                const MoreLikeWidget(),
                // Tab(text: 'More like this'.toUpperCase()),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: RecommendationsWidget(),
                ),
              ],
            );
          case RequestState.error:
            return  Center(child: Text(state.movieDetailsMessage));
        }
      },
    )
        : BlocBuilder<TvsDetailsBloc , TvsDetailsState>(
      builder: (context, state) {
        switch(state.tvsDetailsState){

          case RequestState.loading:
            return const Center(child: CircularProgressIndicator(),);
          case RequestState.loaded:
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                AppBarDetails(state: state),
                DetailsWidget(state: state),
                const MoreLikeWidget(),
                // Tab(text: 'More like this'.toUpperCase()),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: RecommendationsWidget(),
                ),
              ],
            );
          case RequestState.error:
            return  Center(child: Text(state.tvsDetailsMessage));
        }
      },
    );
  }
}
