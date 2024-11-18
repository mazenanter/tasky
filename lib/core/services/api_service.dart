import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  static const String baseUrl = 'https://todo.iraqsapp.com';

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    required String accessToken,
  }) async {
    final response = await dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }

  Future<List<dynamic>> getTasks({
    required String endPoint,
    required String accessToken,
  }) async {
    final response = await dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> deleteTasks({
    required String endPoint,
    required String accessToken,
    required String taskId,
  }) async {
    final response = await dio.delete(
      '$baseUrl$endPoint$taskId',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> putRequest({
    required String endPoint,
    required String accessToken,
    required String taskId,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.put(
      '$baseUrl$endPoint$taskId',
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }
}
