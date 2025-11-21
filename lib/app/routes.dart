import 'package:flutter/material.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';
import 'package:eco_tips/features/tips/presentation/home_screen.dart';
import 'package:eco_tips/features/tips/presentation/tip_detail_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/tip_detail':
        final tip = settings.arguments as Tip;
        return MaterialPageRoute(builder: (_) => TipDetailScreen(tip: tip));
      default:
        return null;
    }
  }
}
