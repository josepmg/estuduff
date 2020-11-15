import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';

class Converter {
  static String mapFailureToMessages(Failure failure) {
    if (failure is PlatformFailure)
      return failure.message;
    else if (failure is ServerFailure)
      return EstudUffStrings.server_failure_message;
    else if (failure is NoInternetConnectionFailure)
      return EstudUffStrings.server_failure_message;
    else if (failure is CacheFailure) {
      return EstudUffStrings.cache_failure_message;
    } else
      return EstudUffStrings.generic_failure_message;
  }
}
