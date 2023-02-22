import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class LoggingObserver extends ProviderObserver {
  final Logger _logger = Logger();

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger.d(
      "Provider ${provider.name} updated from $previousValue to $newValue",
    );
  }
}
