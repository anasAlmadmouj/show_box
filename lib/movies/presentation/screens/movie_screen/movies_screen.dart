import 'package:show_box/core/app_imports/app_imports.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(NowPlayingMovieEvent())
        ..add(PopularMovieEvent())
        ..add(TopRatedMovieEvent()),
      child:  Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              TitleRowWidget(title: 'Popular',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PopularScreen(),));
                },
              ),
              const PopularWidget(),
              TitleRowWidget(
                  title: 'Top Rated',
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TopRatedScreen(),));
                },
              ),
              const TopRatedWidget(),
              50.height,
            ],
          ),
        ),
      ),
    );
  }
}
