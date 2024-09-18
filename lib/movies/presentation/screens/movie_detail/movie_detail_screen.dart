import 'package:show_box/core/app_imports/app_imports.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => sl<MoviesDetailsBloc>()
      ..add(GetMovieDetailsEvent(id))
      ..add(GetMoviesRecommendEvent(id: id)),
      lazy: false,
      child: const Scaffold(
        body:  DetailBody(),
      ),
    );
  }
}