import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/app/theme.dart';
import 'package:eco_tips/app/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eco_tips/l10n/app_localizations.dart';

class EcoTipsApp extends ConsumerWidget {
  const EcoTipsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Eco Tips',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
