import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_firebase_web/core/common/services/connection/connection_service.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/errors/not_internet_connection_exception.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/request_result.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/request_service.dart';

class DioRequestService extends RequestService {
  final Dio _dio;
  DioRequestService({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<RequestResult> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      var response = await _dio.get(url, options: Options(headers: headers));
      if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('GET Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      var response = await _dio.post(url, data: body, options: Options(headers: headers));
      if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('POST Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      var response = await _dio.put(url, data: body, options: Options(headers: headers));
      if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('PUT Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> patch(
    String url, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      var response = await _dio.patch(
        url,
        data: formData,
        options: Options(
          headers: headers,
          contentType: 'multipart/form-data',
        ),
      );
      if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('PATCH Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestResult> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!(await _isConnected)) {
        throw NotInternetConnectionException();
      }
      var response = await _dio.delete(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
        return RequestResult(
          statusCode: response.statusCode ?? 0,
          data: response.data,
          headers: response.headers.map,
          success: true,
          message: response.statusMessage ?? '',
        );
      }
      throw Exception('DELETE Request Error, no success status code returned');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> get _isConnected async => await Modular.get<ConnectionService>().isConnected;
}
