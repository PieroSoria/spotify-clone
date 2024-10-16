import 'package:dio/dio.dart';

abstract class ApiClientRepository {
  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
  });
  Future<Response> postData(
    String uri, {
    dynamic data,
    Map<String, dynamic>? header,
  });
  Future<Response> updateData(
    String uri, {
    dynamic data,
    Map<String, dynamic>? header,
  });
  Future<Response> deleteData(
    String uri, {
    dynamic data,
    Map<String, dynamic>? header,
  });
}
