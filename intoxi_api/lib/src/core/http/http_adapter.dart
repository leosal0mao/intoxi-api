abstract class HttpAdapter {
  Future<ResponseData> get({Map<String, String>? headers});
}

class ResponseData {
  final String statusCode;
  final dynamic data;

  ResponseData(this.statusCode, this.data);
}
