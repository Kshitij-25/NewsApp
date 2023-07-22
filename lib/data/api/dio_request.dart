import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioRequest {
  Dio dio = Dio();

  DioRequest() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 150,
    ));
  }

  Future<Response<dynamic>> getReq({url}) async {
    try {
      final response = await dio.get(
        url,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
