import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/core/presentation/controller/app_cubit/app_cubit.dart';
import 'package:show_box/core/presentation/screens/splash/splash_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AppCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movie App',
              theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: Colors.grey.shade900
              ),
              home: const SplashScreen(),
            ),
      ),
    );
  }
}
