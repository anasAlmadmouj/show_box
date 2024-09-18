import 'package:show_box/core/app_imports/app_imports.dart';

class TvsTopRatedScreen extends StatelessWidget {
  const TvsTopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<TvsBloc>()
    ..add(TopRatedTvsEvent()),
  child: Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated'),
        centerTitle: true,
      ),
      body: const TopRatedBody(),
    ),
);
  }
}


