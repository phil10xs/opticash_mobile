// // ignore_for_file: body_might_complete_normally_nullable

// import 'package:flutter/material.dart';
// import '../../domain/usecase/dash_usecases.dart';

import 'package:flutter/material.dart';
import 'package:opticash_mobile/dashboard/domain/usecase/dash_usecases.dart';

import '../../data/model/basemodel.dart';

class DashBaordNotifier with ChangeNotifier {
  DashBaordNotifier({
    required LoginUsecase loginUsecase,
    required SignUpUsecase signUpUsecase,
  })  : _loginUsecase = loginUsecase,
        _signUpUsecase = signUpUsecase;

  final LoginUsecase _loginUsecase;
  final SignUpUsecase _signUpUsecase;

  var _current = 0;

  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  var _section = 0;

  int get section => _section;

  set section(int i) {
    _section = i;
    notifyListeners();
  }

  Result<dynamic>? _signUpResult;
  Result<dynamic>? get signUpResult => _signUpResult;

  set setsignUpResult(Result<dynamic> value) {
    _signUpResult = value;
    notifyListeners();
  }

  Future<Result<dynamic>> signUp({Map<String, dynamic>? param}) async {
    Result<dynamic> result = Result(error: false, loading: true);
    var data = await _signUpUsecase.call(param!);
    data.fold((l) {
      result.error = false;
    }, (r) {
      result.data = r;
      result.error = true;
    });
    result.loading = false;
    setsignUpResult = result;
    return result;
  }
}
