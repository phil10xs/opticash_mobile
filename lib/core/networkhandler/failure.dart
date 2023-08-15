import 'dart:io';
import 'package:dio/dio.dart';
import 'package:opticash_mobile/core/utils/string.dart';

class Failure {
  final String? message;
  final dynamic data;

  Failure({this.message, this.data});
}

class ExceptionHandler {
  static String handleError(error) {
    if (error is SocketException) {
      if (error.osError!.errorCode == 8) {
        return "Please check your internet connection";
      } else if (error.osError!.errorCode == 61 ||
          error.osError!.errorCode == 111) {
        return "The server could not be reached, please try again later.";
      }
    } else if (error is DioError) {
      Logger('error response  dataHandler $error');
      return parseDioErrorMessage(error);
    }

    return 'Unknown error';
  }

  static String parseDioErrorMessage(DioError dioError) {
    String message = "";
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";

        break;
      case DioErrorType.other:
        message = 'Please check your internet connection';
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        /* cases where we have a custom error message from the APIs
        We'll have a response from the APIs [for some status codes],

        IF THERE IS A PAYLOAD,

        e.g
        {
          "status": false,
          "message": "Incorrect credentials",
        }

        we extract the value present in the key=>[message]
        */
        if (dioError.response?.data != null) {
          if (dioError.response?.statusCode == 413) {
            message = "File too large";
          }
          if (dioError.response?.data != null &&
              dioError.response!.data!.toString().contains('502 Bad Gateway')) {
            message = 'Something went wrong.';
          } else {
            // if (dioError.response?.data != null &&
            //     dioError.response!.data!.toString().contains('failed')) {
            //   // message = "${(dioError.response!.data as Map)['message']}";
            // }
            if (dioError.response!.data is String) {
              return dioError.response!.data;
            } else if (dioError.response!.data is Map) {
              var map = dioError.response!.data;
              if (map.containsKey('error')) {
                return map['error'].toString();
                // return '\n${(map)['error'].toString().replaceAll(RegExp(r'[^\w\s]+'), '')}\n${(map)['detail'].toString().replaceAll(RegExp(r'[^\w\s]+'), '')}';
              } else if (map.containsKey('message')) {
                return '${map['message'] ?? ''}';
              }
            }
          }
        } else {
          // IF THERE IS NO PAYLOAD, we check for respective status codes and assign dimfit error messages
          switch (dioError.response?.statusCode) {
            case 504:
            case 500:
            case 404:
            case 502:
            case 400:
            case 403:
              return "An error occurred, please try again";
            case 401:
            // return UnAuthorizedException();
            case 413:
              return "File too large";
            default:
              // default exception error message
              return "An error occurred, please try again";
          }
        }
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }

    return message;
  }
}
