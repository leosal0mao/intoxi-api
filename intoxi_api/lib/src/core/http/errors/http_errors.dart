import '../../helpers/errors.dart';

class HttpError extends Failure {
  String? statusCode;
  HttpError({
    String? message,
    StackTrace? stackTrace,
    this.statusCode,
  }) : super(message!, stackTrace!);
}
