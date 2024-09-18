import 'package:show_box/core/app_imports/app_imports.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<MoviesBloc>()
    ..add(TopRatedMovieEvent()),
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


