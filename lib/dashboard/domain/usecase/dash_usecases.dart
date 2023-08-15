import 'package:dartz/dartz.dart';

import 'package:opticash_mobile/core/networkhandler/failure.dart';
import 'package:opticash_mobile/dashboard/domain/repository/repo.dart';
import '../../../../core/usecases/usecases.dart';

class GetAccountUsecase extends Usecase<void, NoParams> {
  GetAccountUsecase({
    required this.repository,
  });

  final DashBoardRepository repository;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) async =>
      await repository.getAccounts();
}

class GetUserProfileUsecase extends Usecase<void, NoParams> {
  GetUserProfileUsecase({
    required this.repository,
  });

  final DashBoardRepository repository;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) async =>
      await repository.getUserProfile();
}
