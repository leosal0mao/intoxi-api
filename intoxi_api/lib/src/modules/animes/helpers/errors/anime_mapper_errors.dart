import 'package:intoxi_api/src/core/helpers/errors.dart';

class AnimeMapperErrors extends Failure {
  AnimeMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
