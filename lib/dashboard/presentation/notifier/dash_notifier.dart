// // ignore_for_file: body_might_complete_normally_nullable

// import 'package:flutter/material.dart';
// import '../../domain/usecase/dash_usecases.dart';

// class DashBaordNotifier with ChangeNotifier {
//   DashBaordNotifier({
//     required GetAccountUsecase getAccountUsecase,
//     required GetUserProfileUsecase getUserProfileUsecase,
//     required GetDebittableAccountUsecase getDebittableAccountUsecase,
//   })  : _getDebittableAccountUsecase = getDebittableAccountUsecase,
//         _getUserProfileUsecase = getUserProfileUsecase,
//         _getAccountUsecase = getAccountUsecase;

//   final GetAccountUsecase _getAccountUsecase;
//   final GetUserProfileUsecase _getUserProfileUsecase;
//   final GetDebittableAccountUsecase _getDebittableAccountUsecase;

//   var _current = 0;

//   int get current => _current;

//   set current(int value) {
//     _current = value;
//     notifyListeners();
//   }

//   var _section = 0;

//   int get section => _section;

//   set section(int i) {
//     _section = i;
//     notifyListeners();
//   }

//   Result<List<AccountModel>>? _accountsResult;

//   Result<List<AccountModel>>? get accountsResult => _accountsResult;
//   String? _error;

//   String? get error => _error;

//   set error(String? err) {
//     _error = err;
//     notifyListeners();
//   }

//   set setaccountsResult(Result<List<AccountModel>>? value) {
//     _accountsResult = value;
//     notifyListeners();
//   }

//   Result<List<AccountModel>>? _debittableaccountsResult;

//   Result<List<AccountModel>>? get debittableaccountsResult =>
//       _debittableaccountsResult;

//   set setdebittableaccountsResult(Result<List<AccountModel>>? value) {
//     _debittableaccountsResult = value;
//     notifyListeners();
//   }

//   Result<UserModel>? _userResult;

//   Result<UserModel>? get userResult => _userResult;

//   set setUserResult(Result<UserModel>? value) {
//     _userResult = value;
//     notifyListeners();
//   }

//   DashboardStatus status = DashboardStatus.none;
//   Progress progress = Progress.idle;

//   setState(DashboardStatus status, Progress progress) {
//     this.status = status;
//     this.progress = progress;
//     notifyListeners();
//   }

//   Future<Result<List<AccountModel>>> getAccounts() async {
//     Result<List<AccountModel>> result = Result(error: false);
//     Log.d("accounts result start ");
//     setState(DashboardStatus.account, Progress.loading);
//     // await Future.delayed(const Duration(seconds: 5));
//     var data = await _getAccountUsecase.call(const NoParams());

//     data.fold((l) {
//       _error = l.message;
//       setState(DashboardStatus.account, Progress.error);
//       Log.d("accounts result fail ${l.message}");

//       return Left(l);
//     }, (r) {
//       Log.d("accounts result${r.toString()}");
//       result.data = AccountModel.fromJsonList(r['result']);
//       result.userMessage = r['message'];
//       result.response = r['response'];
//       setaccountsResult = result;
//       setState(DashboardStatus.account, Progress.success);
//       Log.d("accounts result${result.data?.first.toJson()}");
//     });

//     return result;
//   }

//   Future<Result<List<AccountModel>>> getDebittableAccount() async {
//     Result<List<AccountModel>> result = Result(error: false);
//     setState(DashboardStatus.account, Progress.loading);

//     var data = await _getDebittableAccountUsecase.call(const NoParams());

//     data.fold((l) {
//       Log.d("User result fail ${l.message}");
//       setState(DashboardStatus.account, Progress.error);
//       return Left(l);
//     }, (r) {
//       result.data = AccountModel.fromJsonList(r['result']);
//       result.userMessage = r['message'];
//       result.response = r['response'];
//       setaccountsResult = result;
//       setState(DashboardStatus.account, Progress.success);
//     });
//     return result;
//   }

//   Future<Result<UserModel>> getUserDetails() async {
//     Result<UserModel> result = Result(error: false);
//     Log.d("User result start ${result.data?.toJson()}");
//     setState(DashboardStatus.profile, Progress.loading);
//     var data = await _getUserProfileUsecase.call(const NoParams());

//     data.fold((l) {
//       setState(DashboardStatus.profile, Progress.error);
//       Log.d("User result fail ${l.message}");
//       return Left(l);
//     }, (r) {
//       result.data = UserModel.fromJson(r['result']);
//       result.userMessage = r['message'];
//       result.response = r['response'];
//       setUserResult = result;
//       setState(DashboardStatus.profile, Progress.success);
//       Log.d("User result${result.data?.toJson()}");
//     });

//     return result;
//   }
// }

// enum Progress {
//   loading,
//   success,
//   error,
//   idle;

//   bool get isLoading => this == Progress.loading;

//   bool get isSuccess => this == Progress.success;

//   bool get isError => this == Progress.error;

//   bool get isIdle => this == Progress.idle;
// }

// enum DashboardStatus {
//   account,
//   profile,
//   none;

//   bool get isAccount => this == DashboardStatus.account;

//   bool get isProfile => this == DashboardStatus.profile;

//   bool get isNone => this == DashboardStatus.none;
// }
