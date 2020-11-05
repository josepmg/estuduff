import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';

class Converter {
  static String mapFailureToMessages(Failure failure) {
    if (failure is PlatformFailure)
      return failure.message;
    else if (failure is ServerFailure)
      return EstuduffStrings.server_failure_message;
    else if (failure is NoInternetConnectionFailure)
      return EstuduffStrings.server_failure_message;
    else if (failure is CacheFailure) {
      return EstuduffStrings.cache_failure_message;
    } else
      return EstuduffStrings.generic_failure_message;
  }
}
