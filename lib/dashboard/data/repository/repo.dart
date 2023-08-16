import 'package:dartz/dartz.dart';
import 'package:opticash_mobile/core/utils/logger.dart';
import '../../../../core/networkhandler/failure.dart';
import '../../domain/repository/repo.dart';
import '../datasource/remote/remote.dart';

class DashBoardRepositoryImpl implements DashBoardRepository {
  DashBoardRepositoryImpl({
    required this.remoteDatasource,
  });

  final DashBoardRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required Map<String, dynamic> data}) async {
    try {
      try {
        var response = await remoteDatasource.signup(data: data);

        return Right(response.data!);
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } catch (e) {
      Log.d("User result fail ${e}");
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signup(
      {required Map<String, dynamic> data}) async {
    try {
      try {
        var response = await remoteDatasource.signup(data: data);

        return Right(response.data!);
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } catch (e) {
      Log.d("User result fail ${e}");
      return Left(Failure(message: e.toString()));
    }
  }
}
