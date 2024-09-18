import 'package:show_box/core/app_imports/app_imports.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  const CustomImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // width: 120.0,
      fit: BoxFit.cover,
      imageUrl: ApiConstants.imageUrl(imagePath),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
    );
  }
}
