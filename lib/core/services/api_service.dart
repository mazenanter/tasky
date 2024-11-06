import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  static const String baseUrl = 'https://todo.iraqsapp.com';

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
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
}
