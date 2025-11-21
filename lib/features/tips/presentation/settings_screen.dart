import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/features/crash_reporting/crash_reporting_toggle.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings & Privacy')),
      body: ListView(
        children: const [
          CrashReportingToggle(),
          // Future: add privacy policy link and other settings
        ],
      ),
    );
  }
}
