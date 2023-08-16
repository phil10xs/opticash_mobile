import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:opticash_mobile/core/networkhandler/interceptor.dart';
import 'package:opticash_mobile/core/networkhandler/network_requester.dart';
import 'package:opticash_mobile/dashboard/data/datasource/remote/remote.dart';
import 'package:opticash_mobile/dashboard/data/repository/repo.dart';
import 'package:opticash_mobile/dashboard/domain/repository/repo.dart';
import 'package:opticash_mobile/dashboard/domain/usecase/dash_usecases.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dash_notifier.dart';

GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  ///network
  BaseOptions options = BaseOptions(
      baseUrl: "https://devapi.opticash.io/api/v1",
      receiveDataWhenStatusError: true,
      sendTimeout: 30 * 10000,
      connectTimeout: 30 * 10000,
      // 60 seconds
      receiveTimeout: 30 * 100000 // 60 seconds
      );

  //module
  var interceptor = VulteInterceptor();
  getIt.registerLazySingleton<VulteInterceptor>(() => interceptor);
  var dio = Dio(options);
  getIt.registerLazySingleton<Dio>(
    () => dio,
  );
  dio.interceptors.add(interceptor);

  //datasource
  getIt.registerLazySingleton<NetworkRequester>(
      () => NetworkRequester(dio: getIt()));
  getIt.registerLazySingleton<DashBoardRemoteDatasource>(
      () => DashBoardRemoteDatasourceImpl(networkRequester: getIt()));

  getIt.registerLazySingleton<DashBoardRepository>(
    () => DashBoardRepositoryImpl(
      remoteDatasource: getIt(),
    ),
  );

  //usecases
  getIt.registerLazySingleton(
    () => LoginUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton(
    () => SignUpUsecase(repository: getIt()),
  );

  getIt.registerLazySingleton<DashBaordNotifier>(
      () => DashBaordNotifier(loginUsecase: getIt(), signUpUsecase: getIt()));
}
