// ignore: file_names
import 'package:appdynamics_agent/appdynamics_agent.dart';
import 'package:dio/dio.dart';
import 'package:opticash_mobile/core/utils/string.dart';

import '../utils/logger.dart';
import 'failure.dart';

class NetworkRequester {
  NetworkRequester({
    required this.dioAppDynamicsTracked,
    required this.dio,
  });

  final TrackedDioClient dioAppDynamicsTracked;
  final Dio dio;

  String _token = '';

  set token(String token) {
    _token = token;
  }

  void clearSession() {
    // clears token
    _token = '';
  }

  Future<Response<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? data,
    bool isProtected = false,
    bool isFormData = false,
    String? contentType,
  }) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: {},
        options: Options(
          method: 'GET',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      Log.d(e.toString());
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response> post(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = false,
    bool isFormData = false,
    String? contentType,
  }) async {
    try {
      Log.d("network b4");
      Log.d("network request: $data");

      Response response = await dio.post<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: {},
        options: Options(
          method: 'POST',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      Log.d("network err: $e");
      Logger(e.toString());
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response> patch(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = false,
    bool isFormData = false,
    String? contentType,
  }) async {
    try {
      Response response = await dio.patch<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: {},
        options: Options(
          method: 'PATCH',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      Logger(e.toString());
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response> delete(String endpoint,
      {required Map<String, dynamic> data,
      bool isProtected = false,
      bool isFormData = false,
      String? contentType}) async {
    try {
      Response response = await dio.delete<Map<String, dynamic>>(
        endpoint,
        queryParameters: {},
        options: Options(
          method: 'DELETE',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      Logger(e.toString());
      throw ExceptionHandler.handleError(e);
    }
  }
}
