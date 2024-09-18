import 'package:show_box/core/app_imports/app_imports.dart';

class HorizontalListMoviesItem extends StatelessWidget {
  final Movie item;
  const HorizontalListMoviesItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap:  () {
          navigateTo(context, MovieDetailScreen(id: item.id));
        },
        child: ClipRRect(
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            // width: 120.0,
            fit: BoxFit.fill,
            imageUrl: ApiConstants.imageUrl(item.backdropPath,),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                // width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}