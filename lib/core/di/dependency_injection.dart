import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/api_service.dart';
import 'package:omar_ahmad_advanced_concept/core/networking/dio_factory.dart';
import 'package:omar_ahmad_advanced_concept/features/login/data/repos/login_repo.dart';
import 'package:omar_ahmad_advanced_concept/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiServices
  Dio dio =   DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
