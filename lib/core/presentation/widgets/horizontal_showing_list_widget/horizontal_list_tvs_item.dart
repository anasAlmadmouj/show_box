import 'package:show_box/core/app_imports/app_imports.dart';

class HorizontalListTvsItem extends StatelessWidget {
  final Tvs item;
  const HorizontalListTvsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap:  () {
          navigateTo(context, TvsDetailScreen(id: item.id));
        },
        child: ClipRRect(
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            // width: 120.0,
            fit: BoxFit.cover,
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

