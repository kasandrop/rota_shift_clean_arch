import 'package:dartz/dartz.dart';
import 'package:rotashiftcleanarch/core/error/failures.dart';
import 'package:rotashiftcleanarch/core/util/simple_log_printer.dart';

class InputConverter {
  final log = getLogger('InputConverter');

  InputConverter() {
    log.d('InputConverter');
  }

  Either<Failure, int> stringToUnsignedInteger(String str) {
    log.d(' stringToUnsignedInteger()');
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
