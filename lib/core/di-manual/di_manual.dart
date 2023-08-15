import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:opticash_mobile/core/networkhandler/interceptor.dart';
import 'package:opticash_mobile/dashboard/data/datasource/remote/remote.dart';
import 'package:opticash_mobile/dashboard/data/repository/repo.dart';
import 'package:opticash_mobile/dashboard/domain/repository/repo.dart';
import 'package:opticash_mobile/dashboard/domain/usecase/dash_usecases.dart';

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
  getIt.registerLazySingleton<Dio>(() => dio);
  dio.interceptors.add(interceptor);

  //datasource
  getIt.registerLazySingleton<DashBoardRemoteDatasource>(
      () => DashBoardRemoteDatasourceImpl(networkRequester: getIt()));

//   // Auth datasource
//   getIt.registerLazySingleton<AuthRemoteDatasource>(
//       () => AuthRemoteDatasourceImpl(networkRequester: getIt()));

// // repo
//   getIt.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(
//       dbLocalDatasource: getIt(),
//       remoteDatasource: getIt(),
//     ),
//   );

  getIt.registerLazySingleton<DashBoardRepository>(
    () => DashBoardRepositoryImpl(
      remoteDatasource: getIt(),
    ),
  );

  //usecases
  getIt.registerLazySingleton(
    () => GetAccountUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetUserProfileUsecase(repository: getIt()),
  );

// Notifier
  // getIt.registerLazySingleton<LoginNotifier>(
  //   () => LoginNotifier(
  //     getIt(),
  //   ),
  // );
  // getIt.registerLazySingleton<DashBaordNotifier>(() => DashBaordNotifier(
  //     getAccountUsecase: getIt(),
  //     getUserProfileUsecase: getIt(),
  //     getDebittableAccountUsecase: getIt()));
}
