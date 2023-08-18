// // ignore_for_file: body_might_complete_normally_nullable

// import 'package:flutter/material.dart';
// import '../../domain/usecase/dash_usecases.dart';

// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:opticash_mobile/dashboard/data/model/accountmodel.dart';

import 'package:opticash_mobile/dashboard/domain/usecase/dash_usecases.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dashboard_mixin.dart';

import '../../data/model/basemodel.dart';

class DashBaordNotifier extends ChangeNotifier with DashBoardNotifierMixin {
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

  Map<String, dynamic> _credentials = {
    "first_name": null,
    "last_name": null,
    "email": null,
    "password": null
  };

  Map<String, dynamic> _loginCredentials = {
    "email": null,
    "password": null,
  };

  Map<String, dynamic> get credentials => _credentials;
  Map<String, dynamic> get loginCredentials => _loginCredentials;

  void updateCredential(String key, var value) {
    if (_credentials.containsKey(key)) {
      _credentials.update(key, (_) => value);
    } else {
      _credentials.putIfAbsent(key, () => value);
    }

    notifyListeners();
  }

  void updateLoginCredential(String key, var value) {
    if (loginCredentials.containsKey(key)) {
      loginCredentials.update(key, (_) => value);
    } else {
      loginCredentials.putIfAbsent(key, () => value);
    }

    log('test ${loginCredentials}');

    notifyListeners();
  }

  Result<User>? _signInResult;
  Result<User>? get signInResult => _signInResult;

  set setsignInResult(Result<User> value) {
    _signInResult = value;
    notifyListeners();
  }

  signUp(BuildContext context, {Map<String, dynamic>? param}) async {
    Result<dynamic> result = Result(error: false, loading: true, message: "");
    var data = await _signUpUsecase.call(param!);
    data.fold((l) {
      result.error = false;
      result.message = l.message;
      handleFailedResponse(context, l.message!);
    }, (r) {
      result.message = r['message'];
      result.error = true;
      handleSuccess(context);
    });
    result.loading = false;
  }

  login(BuildContext context, {Map<String, dynamic>? param}) async {
    Result<User> result = Result(error: false, loading: true, message: "");
    var data = await _loginUsecase.call(param!);
    data.fold((l) {
      result.error = false;
      result.message = l.message;
      handleFailedResponse(context, l.message!);
    }, (r) {
      result.message = r['message'];
      result.data = User.fromJson(r['data']['user']);
      result.error = true;
      handleLoginSuccess(context);
    });
    result.loading = false;
    setsignInResult = result;
  }
}
