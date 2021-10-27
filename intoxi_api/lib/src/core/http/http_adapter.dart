abstract class HttpAdapter {
  Future<ResponseData> get({Map<String, dynamic>? queries});
}

class ResponseData {
  final String statusCode;
  final dynamic data;

  ResponseData(
    this.statusCode,
    this.data,
  );
}
