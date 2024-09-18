import 'package:show_box/core/app_imports/app_imports.dart';

class CustomImageRecommendation extends StatelessWidget {
  final String? imagePath;
  const CustomImageRecommendation({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 500),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: ApiConstants.imageUrl(imagePath!),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
            height: 180.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
