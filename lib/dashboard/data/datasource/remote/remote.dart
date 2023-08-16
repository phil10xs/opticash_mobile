import 'package:dio/dio.dart';
import 'package:opticash_mobile/core/networkhandler/network_requester.dart';

abstract class DashBoardRemoteDatasource {
  Future<Response<dynamic>> signup({required Map<String, dynamic> data});
  Future<Response<dynamic>> login({required Map<String, dynamic> data});
}

class DashBoardRemoteDatasourceImpl extends DashBoardRemoteDatasource {
  DashBoardRemoteDatasourceImpl({
    required this.networkRequester,
  });

  final NetworkRequester networkRequester;

  @override
  Future<Response<dynamic>> login({required Map<String, dynamic> data}) async {
    var response = await networkRequester.post(
      '/user/test/login',
      isProtected: false,
      contentType: 'application/json',
      data: data,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> signup({required Map<String, dynamic> data}) async {
    var response = await networkRequester.post(
      '/user/test/register',
      isProtected: true,
      data: data,
      contentType: "application/json",
    );
    return response;
  }
}
