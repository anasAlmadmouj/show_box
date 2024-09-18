import 'package:show_box/core/app_imports/app_imports.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(PopularMovieEvent()),
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
