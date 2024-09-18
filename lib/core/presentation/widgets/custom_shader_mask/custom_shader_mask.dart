import 'package:show_box/core/app_imports/app_imports.dart';

class CustomShaderMask extends StatelessWidget {
  final String imagePath;
  const CustomShaderMask({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0.0, 0.5, 1.0, 1.0],
        ).createShader(
          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width,
        imageUrl: ApiConstants.imageUrl(imagePath),
        fit: BoxFit.fill,
      ),
    );
  }
}
