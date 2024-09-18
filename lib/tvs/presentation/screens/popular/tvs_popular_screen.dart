import 'package:show_box/core/app_imports/app_imports.dart';

class TvsPopularScreen extends StatelessWidget {
  const TvsPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvsBloc>()
        ..add(PopularTvsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular'),
          centerTitle: true,
        ),
        body: const PopularBody(),
      ),
    );
  }
}
