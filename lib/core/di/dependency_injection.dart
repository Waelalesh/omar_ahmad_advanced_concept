import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_service.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/dio_factory.dart';
import 'package:omar_ahmad_advanced_concept/features/home/data/apis/home_api_service.dart';
import 'package:omar_ahmad_advanced_concept/features/home/data/repos/home_repo.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/repos/login_repo.dart';
import 'package:omar_ahmad_advanced_concept/features/login/logic/cubit/login_cubit.dart';

import '../../features/sign_up/data/repo/sign_up_repo.dart';
import '../../features/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
