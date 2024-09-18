import 'package:show_box/core/app_imports/app_imports.dart';

class BodyListItem<T> extends StatelessWidget {
  final List<T> list;
  const BodyListItem({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          final bool movie = AppCubit.get(context).appType == AppType.movies ? true : false;
          return Container(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap:  () {
                AppCubit.get(context).appType == AppType.movies ?
                navigateTo(context , MovieDetailScreen(id: (item as Movie).id),)
                : navigateTo(context , TvsDetailScreen(id: (item as Tvs).id),);
              },
              child: ClipRRect(
                borderRadius:
                const BorderRadius.all(Radius.circular(8.0)),
                child: Column(
                  children: [
                    CustomImage(imagePath: movie ? (item as Movie).backdropPath : (item as Tvs).backdropPath),
                    10.height,
                    Text(AppCubit.get(context).appType == AppType.movies ? (item as Movie).name : (item as Tvs).name , style: TextStyle(fontWeight: FontWeight.bold),),
                    10.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(AppCubit.get(context).appType == AppType.movies ? (item as Movie).overview : (item as Tvs).overview, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 20.height,
      ),
    );
  }
}
