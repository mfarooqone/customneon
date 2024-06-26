// ignore_for_file: unused_field

import 'dart:developer';
import 'dart:io';

import 'package:customneon/network_client/api_response.dart';
import 'package:customneon/utills/app_consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

typedef GetUserAuthTokenCallback = Future<String?> Function();

class NetworkClient {
  static const contentTypeJson = 'application/json';
  static const contentTypeMultipart = 'multipart/form-data';

  final GetUserAuthTokenCallback _getUserAuthToken;
  final Dio _restClient;
  final Dio _fileClient;

  ///
  ///
  ///
  NetworkClient({
    required GetUserAuthTokenCallback getUserAuthToken,
  })  : _getUserAuthToken = getUserAuthToken,
        _restClient = _createDio(AppConsts.baseApiUrl),
        _fileClient = _createDio(AppConsts.baseApiUrl);

  ///
  ///
  ///
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.get(
        path,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioException catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
    bool? isStripe = false,
  }) async {
    try {
      final resp = await _restClient.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: isStripe == false
            ? await _createDioOptions(
                contentType: contentTypeJson,
                sendUserAuth: sendUserAuth,
              )
            : await _createDioStripeOptions(
                contentType: contentTypeJson,
              ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioException catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioException catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioException catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioException catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> upload<T>(
    String path, {
    required File file,
    bool? sendUserAuth,
  }) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final resp = await _fileClient.post(
        path,
        data: formData,
        options: await _createDioOptions(
          contentType: contentTypeMultipart,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioException catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  ApiResponse<T> _createResponse<T>(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiResponse<T>.error(
          statusCode: 501,
          message: 'Connection timed out',
        );
      case DioExceptionType.connectionError:
        return ApiResponse<T>.error(
          statusCode: 502,
          message: 'Connection Error',
        );
      case DioExceptionType.unknown:
        return ApiResponse<T>.error(
          statusCode: 503,
          message:
              'Something went wrong,check your internet connection try again later',
        );
      case DioExceptionType.receiveTimeout:
        return ApiResponse<T>.error(
          statusCode: 502,
          message: 'Recieve timed out',
        );
      case DioExceptionType.sendTimeout:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Failed to connected to server',
        );

      case DioExceptionType.badResponse:
        final jsonResp = error.response!.data;
        final errorStr = jsonResp['error'] as String;
        final message = jsonResp['message'] as String;
        return ApiResponse<T>.error(
          statusCode: error.response?.statusCode,
          error: errorStr,
          message: message,
        );
      case DioExceptionType.cancel:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Request canceled',
        );

      case DioExceptionType.badCertificate:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Bad Certificate',
        );
    }
  }

  ///
  ///
  ///
  Future<Options> _createDioOptions({
    required String contentType,
    bool? sendUserAuth,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };

    final options = Options(
      headers: headers,
      contentType: contentType,
    );
    return options;
  }

  ///
  ///
  ///
  Future<Options> _createDioStripeOptions({
    required String contentType,
  }) async {
    final headers = <String, String>{
      'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    final options = Options(
      headers: headers,
      contentType: contentType,
    );
    return options;
  }

  ///
  ///
  ///
  static Dio _createDio(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
    );
    final dio = Dio(options);
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        responseBody: true,
        requestBody: true,
        logPrint: (message) {
          log(message.toString());
        },
      ),
    );
    return dio;
  }
}
