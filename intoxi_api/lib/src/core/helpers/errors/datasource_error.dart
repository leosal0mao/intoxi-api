import 'failure.dart';

class DatasourceError extends Failure {
  DatasourceError({
    required String message,
    required StackTrace stackTrace,
  }) : super(message, stackTrace);
}
