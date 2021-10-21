import '../../helpers/errors.dart';

class HttpError extends Failure {
  HttpError(String message, StackTrace stackTrace) : super(message, stackTrace);
}
