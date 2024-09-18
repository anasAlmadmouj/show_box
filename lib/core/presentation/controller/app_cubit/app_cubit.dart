import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/core/enums/type_app/type_app.dart';
import 'package:show_box/core/presentation/controller/app_cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  static AppCubit get(context) => BlocProvider.of(context);

  //Variables
  AppType appType = AppType.movies;
}
