import 'package:show_box/core/app_imports/app_imports.dart';

class MainTvsScreen extends StatelessWidget {
  const MainTvsScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvsBloc>()
        ..add(NowPlayingTvsEvent())
        ..add(PopularTvsEvent())
        ..add(TopRatedTvsEvent()),
      child:  Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              TitleRowWidget(title: 'Popular',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvsPopularScreen(),));
                },
              ),
              const PopularWidget(),
              TitleRowWidget(
                  title: 'Top Rated',
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TvsTopRatedScreen(),));
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
