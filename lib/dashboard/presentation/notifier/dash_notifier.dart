// // ignore_for_file: body_might_complete_normally_nullable

// import 'package:flutter/material.dart';
// import '../../domain/usecase/dash_usecases.dart';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:opticash_mobile/dashboard/domain/usecase/dash_usecases.dart';
import 'package:provider/provider.dart';

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
    Result<dynamic> result = Result(error: false, loading: true, message: "");
    var data = await _signUpUsecase.call(param!);
    data.fold((l) {
      result.error = false;
      result.message = l.message;
    }, (r) {
      result.message = r['message'];
      result.data = r['data'];
      result.error = true;
    });
    result.loading = false;
    setsignUpResult = result;
    return signUpResult!;
  }
}

// extension BuildContextNotifier on BuildContext {
//   DashBaordNotifier get mynotifier =>
//       Provider.of<DashBaordNotifier>(this, listen: false);

//   T read<T>() => Provider.of<T>(this, listen: false);

//   T watch<T>() => Provider.of<T>(this, listen: true);

//   ThemeData get theme => Theme.of(this);
// }
