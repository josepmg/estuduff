import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';

class Converter {
  static String mapFailureToMessages(Failure failure) {
    if (failure is PlatformFailure)
      return failure.message;
    else if (failure is ServerFailure)
      return StringsEstudUff.server_failure_message;
    else if (failure is NoInternetConnectionFailure)
      return StringsEstudUff.server_failure_message;
    else if (failure is CacheFailure) {
      return StringsEstudUff.cache_failure_message;
    } else
      return StringsEstudUff.generic_failure_message;
  }
}
