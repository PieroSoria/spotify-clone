import 'package:dio/dio.dart';
import 'package:my_app/core/api/api_client_repository.dart';
import 'package:my_app/core/helper/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient implements ApiClientRepository {
  final SharedPreferences sharedPreferences;
  final String baseUrl;
  Dio dio;
  String? token;
  ApiClient({required this.sharedPreferences, required this.baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 40),
            receiveTimeout: const Duration(seconds: 40),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ) {
    token = sharedPreferences.getString(AppConstants.token);
    if (token != null) {
      dio.options.headers['Authorization'] = "Bearer $token";
    }
  }

  @override
  Future<Response> deleteData(
    String uri, {
    dynamic data,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await dio.delete(
        uri,
        data: data,
        options: Options(
          headers: header ?? dio.options.headers,
        ),
      );
      return Response(
        statusCode: response.statusCode,
        data: response.data,
        requestOptions: response.requestOptions,
      );
    } catch (e) {
      return Response(
        statusCode: 500,
        data: e.toString(),
        requestOptions: RequestOptions(),
      );
    }
  }

  @override
  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(uri);
      return Response(
        statusCode: response.statusCode,
        data: response.data,
        requestOptions: response.requestOptions,
      );
    } catch (e) {
      return Response(
        statusCode: 500,
        data: e.toString(),
        requestOptions: RequestOptions(),
      );
    }
  }

  @override
  Future<Response> postData(
    String uri, {
    dynamic data,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await dio.post(
        uri,
        data: data,
        options: Options(
          headers: header ?? dio.options.headers,
        ),
      );
      return Response(
        statusCode: response.statusCode,
        data: response.data,
        requestOptions: response.requestOptions,
      );
    } catch (e) {
      return Response(
        statusCode: 500,
        data: e.toString(),
        requestOptions: RequestOptions(),
      );
    }
  }

  @override
  Future<Response> updateData(
    String uri, {
    dynamic data,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await dio.put(
        uri,
        data: data,
        options: Options(
          headers: header ?? dio.options.headers,
        ),
      );
      return Response(
        statusCode: response.statusCode,
        data: response.data,
        requestOptions: response.requestOptions,
      );
    } catch (e) {
      return Response(
        statusCode: 500,
        data: e.toString(),
        requestOptions: RequestOptions(),
      );
    }
  }
}
