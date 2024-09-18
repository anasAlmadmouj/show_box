import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/core/navigator/navigator_helper.dart';
import 'package:show_box/core/presentation/widgets/home/home_item.dart';
import 'package:show_box/core/presentation/widgets/logo/logo_widget.dart';
import 'package:show_box/tvs/presentation/screens/tvs_screen/tvs_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff726f79), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(),
              HomeItem(
                  text: 'Movies',
                  icon: Icons.movie,
                  onTap: (){
                    AppCubit.get(context).appType = AppType.movies;
                    navigateTo(context, const MainMoviesScreen());
                  },
              ),
              30.height,
              HomeItem(
                text: 'Series',
                icon: Icons.tv,
                onTap: (){
                  AppCubit.get(context).appType = AppType.tvs;
                  navigateTo(context, const MainTvsScreen());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
