import 'package:logger/logger.dart' as sh;

abstract class Logger {
  void d(String message);

  void e(String message, [Object? error, StackTrace? stackTrace]);

  void i(String message);

  void w(String message);
}

final Logger logger = SourceHorizonLogger();

class SourceHorizonLogger extends Logger {
  final logger = sh.Logger(
    printer: sh.PrettyPrinter(
      lineLength: 500,
    ),
  );

  @override
  void d(String message) {
    logger.d(message);
  }

  @override
  void e(String message, [Object? error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void i(String message) {
    logger.i(message);
  }

  @override
  void w(String message) {
    logger.w(message);
  }
}
