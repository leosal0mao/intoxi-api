import '../../helpers/errors/failure.dart';

class HttpError extends Failure {
  String? statusCode;
  HttpError({
    String? message,
    StackTrace? stackTrace,
    this.statusCode,
  }) : super(message!, stackTrace!);
}
