import 'package:show_box/core/app_imports/app_imports.dart';
import 'package:show_box/core/presentation/controller/app_cubit/app_cubit.dart';
import 'package:show_box/tvs/data/datasource/tvs_remote_datasource.dart';
import 'package:show_box/tvs/data/repository/tvs_repository.dart';
import 'package:show_box/tvs/domain/repository/base_tvs_repository.dart';
import 'package:show_box/tvs/domain/usecases/get_now_playing_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_recommenation_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:show_box/tvs/domain/usecases/get_tvs_details_usecase.dart';
import 'package:show_box/tvs/presentation/controller/tvs_bloc.dart';
import 'package:show_box/tvs/presentation/controller/tvs_detalis_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {
  void init(){
    //movie bloc
    sl.registerFactory(() => AppCubit());
    //movie bloc
    sl.registerFactory(() => MoviesBloc(sl() , sl() , sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));
    //movie data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    //movie repositories
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    // movie use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    //tvs bloc
    sl.registerFactory(() => TvsBloc(sl() , sl() , sl()));
    sl.registerFactory(() => TvsDetailsBloc(sl(), sl()));
    //tvs data source
    sl.registerLazySingleton<BaseTvsRemoteDataSource>(() => TvsRemoteDataSource());
    //tvs repositories
    sl.registerLazySingleton<BaseTvsRepository>(() => TvsRepository(sl()));
    // tvs use cases
    sl.registerLazySingleton(() => GetNowPlayingTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvsDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationTvsUseCase(sl()));

  }
}