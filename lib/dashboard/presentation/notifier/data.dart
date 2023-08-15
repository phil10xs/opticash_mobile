// // ignore_for_file: body_might_complete_normally_nullable
//
// import 'package:dartz/dartz.dart';
// import 'package:digitalbankmobilex/core/networkhandler/failure.dart';
// import 'package:digitalbankmobilex/core/utils/string.dart';
// import 'package:digitalbankmobilex/features/authentication/data/domain/usecase/auth_use_data.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../core/usecases/usecases.dart';
// // import '../../domain/usecase/get_datax.dart';
//
// class MyNotifier with ChangeNotifier {
//   MyNotifier({
//     required this.postDataUsecase,
//     required this.getDataUsecase,
//   });
//
//   final GetDataUsecase getDataUsecase;
//   final PostDataUsecase postDataUsecase;
//
//   var _current = 0;
//   int get current => _current;
//   set current(int value) {
//     _current = value;
//     notifyListeners();
//   }
//
//   var _section = 0;
//   int get section => _section;
//   set section(int i) {
//     _section = i;
//     notifyListeners();
//   }
//
//   List<dynamic> _people = [];
//   List<dynamic> get people => _people;
//   set setPeople(dynamic value) {
//     _people = value;
//   }
//
//   Map<String, dynamic> _user = {};
//   Map<String, dynamic> get user => _user;
//   set setUser(dynamic value) {
//     _user = value;
//   }
//
//   Map<String, dynamic> _loginCredentials = {};
//   Map<String, dynamic> get loginCredentials => _loginCredentials;
//   set loginCredentials(dynamic value) {
//     _loginCredentials = value;
//     notifyListeners();
//   }
//
//   Future<Either<Failure, List<dynamic>>> getData() async {
//     var data = await getDataUsecase.call(const NoParams());
//     return data.fold((l) => Left(l), (r) {
//       notifyListeners();
//       _people = r;
//       return Right(r);
//     });
//   }
//
//   Future<Either<Failure, dynamic>> loginToDashBoard() async {
//     var data = await postDataUsecase.call(_loginCredentials);
//
//     return data.fold((l) => Left(l), (r) {
//       _user = r.data;
//       notifyListeners();
//       Logger(r.data);
//       return Right(r.data);
//     });
//   }
// }
