import 'package:dartz/dartz.dart';

import '../../../../core/networkhandler/failure.dart';

abstract class DashBoardRepository {
  Future<Either<Failure, Map<String, dynamic>>> signup(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required Map<String, dynamic> data});
}
