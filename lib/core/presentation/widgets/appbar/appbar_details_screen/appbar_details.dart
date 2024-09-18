import 'package:show_box/core/app_imports/app_imports.dart';

class AppBarDetails extends StatelessWidget {
  final dynamic state;
  const AppBarDetails({super.key, required this.state,});

  @override
  Widget build(BuildContext context) {
    AppType appType = AppCubit.get(context).appType;
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250.0.h,
      leading: IconButton(
          onPressed: (){
            maybePop(context);
          },
          icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: CustomShaderMask(
              imagePath: appType == AppType.movies ? (state as MovieDetailsState).movieDetails!.backdropPath
                  : (state as TvsDetailsState).tvsDetails!.backdropPath,),
        ),
      ),
    );
  }
}
