import '../../../core/helpers/errors.dart';

class AnimeRepositoryError extends Failure {
  AnimeRepositoryError(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
