import 'package:dartz/dartz.dart';

import '../../../../core/networkhandler/failure.dart';

abstract class DashBoardRepository {
  Future<Either<Failure, Map<String, dynamic>>> getUserProfile();
  Future<Either<Failure, Map<String, dynamic>>> getAccounts();
}
