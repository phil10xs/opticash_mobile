import 'package:dio/dio.dart';
import 'package:opticash_mobile/core/networkhandler/network_requester.dart';
import 'package:opticash_mobile/core/utils/logger.dart';

abstract class DashBoardRemoteDatasource {
  Future<Response<Map<String, dynamic>>> getUserProfile();
  Future<Response<Map<String, dynamic>>> getAccounts();
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
      '/OAuthToken',
      isProtected: false,
      contentType: 'application/x-www-form-urlencoded',
      data: data,
    );
    return response;
  }

  @override
  Future<Response<Map<String, dynamic>>> getAccounts() async {
    var response = await networkRequester.get(
      '/user/test/register',
      isProtected: true,
      data: {},
      contentType: "application/json",
    );
    return response;
  }

  @override
  Future<Response<Map<String, dynamic>>> getUserProfile() async {
    var response = await networkRequester.get(
      '/profile/api/Profile/GetCustomerProfile',
      isProtected: true,
      data: {},
      contentType: "application/json",
    );
    Log.d("User result source ${response.data.toString()}");
    return response;
  }
}
