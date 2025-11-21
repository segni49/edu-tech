import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'crash_reporting.dart';

class CrashReportingToggle extends ConsumerWidget {
  const CrashReportingToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(crashReportingEnabledProvider);

    return SwitchListTile(
      title: const Text('Enable Crash Reporting'),
      value: enabled,
      onChanged: (value) {
        ref.read(crashReportingEnabledProvider.notifier).state = value;
        if (value) {
          CrashReporting.init();
        }
      },
    );
  }
}
