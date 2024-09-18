import 'package:show_box/core/app_imports/app_imports.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height/5,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageAssets.logoWithoutBg)),
      ),
    );
  }
}
