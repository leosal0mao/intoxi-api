import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intoxi_api/src/core/http/errors/http_errors.dart';

import 'package:intoxi_api/src/core/http/http_adapter.dart';

class HttpAdapterImpl implements HttpAdapter {
  final String url;

  HttpAdapterImpl(this.url);

  @override
  Future<ResponseData> get({Map<String, String>? headers}) async {
    try {
      final dataUrl = Uri.parse(url);

      final response = await http.get(dataUrl, headers: headers);
      final responseJson = jsonDecode(response.body);

      return ResponseData(
          response.statusCode.toString(), responseJson.toString());
    } catch (e, stack) {
      throw HttpError(e.toString(), stack);
    }
  }
}
