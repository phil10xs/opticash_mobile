import 'package:dartz/dartz.dart';

import 'package:opticash_mobile/core/networkhandler/failure.dart';
import 'package:opticash_mobile/dashboard/domain/repository/repo.dart';
import '../../../../core/usecases/usecases.dart';

class LoginUsecase extends Usecase<void, Map<String, dynamic>> {
  LoginUsecase({
    required this.repository,
  });

  final DashBoardRepository repository;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
          Map<String, dynamic> params) async =>
      await repository.login(data: params);
}

class SignUpUsecase extends Usecase<void, Map<String, dynamic>> {
  SignUpUsecase({
    required this.repository,
  });

  final DashBoardRepository repository;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
          Map<String, dynamic> params) async =>
      await repository.signup(data: params);
}
