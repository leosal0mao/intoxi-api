import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intoxi_api/src/core/http/http_adapter.dart';

import 'errors/http_errors.dart';

class HttpAdapterImpl implements HttpAdapter {
  final String url;
  final Dio dio;

  HttpAdapterImpl(this.url, this.dio);

  @override
  Future<ResponseData> get({Map<String, dynamic>? queries}) async {
    try {
      final response = await dio.get(url, queryParameters: queries);

      return ResponseData(response.statusCode.toString(), response.data);
    } on DioError catch (e, stack) {
      throw HttpError(
        statusCode: e.response!.statusCode.toString(),
        message: e.response!.data['message'],
        stackTrace: stack,
      );
    }
  }
}
