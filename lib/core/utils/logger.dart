import 'package:logger/logger.dart';

class Log {
  static final _logger = Logger();
  static d(message) {
    _logger.d(message);
  }
}
