import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  static const String baseUrl = 'https://todo.iraqsapp.com';

  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl$endPoint',
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      return {'error': 'Request failed: ${e.message}'};
    } catch (e) {
      return {'error': 'Unexpected error'};
    }
  }
}
