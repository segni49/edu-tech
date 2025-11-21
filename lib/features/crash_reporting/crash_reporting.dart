import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final crashReportingEnabledProvider = StateProvider<bool>((ref) => false);

class CrashReporting {
  static Future<void> init() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = '<YOUR_SENTRY_DSN>'; // Replace with your DSN
        options.tracesSampleRate = 1.0;
        options.enableAutoSessionTracking = true;
        options.sendDefaultPii = false; // No PII sent
      },
      appRunner: () {},
    );
  }

  static Future<void> captureException(dynamic exception, dynamic stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }
}

final crashReportingProvider = Provider<CrashReporting>((ref) {
  return CrashReporting();
});
