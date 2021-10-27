import 'package:intoxi_api/src/core/helpers/errors.dart';

class AnimeRepositoryError extends Failure {
  AnimeRepositoryError({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message!,
          stackTrace!,
        );
}
