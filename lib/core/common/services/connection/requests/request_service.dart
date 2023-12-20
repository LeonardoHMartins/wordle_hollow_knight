// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:teste_firebase_web/core/common/services/connection/requests/request_result.dart';

abstract class RequestService {
  Future<RequestResult> get(String url, {Map<String, dynamic>? headers});
  Future<RequestResult> post(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
  Future<RequestResult> put(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
  Future<RequestResult> patch(
    String url, {
    FormData? formData,
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
  Future<RequestResult> delete(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
}
