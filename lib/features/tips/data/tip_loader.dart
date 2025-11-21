import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:eco_tips/core/result.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';

class TipLoader {
  static const _assetPath = 'assets/tips.json';

  Future<Result<List<Tip>>> loadTips() async {
    try {
      final jsonString = await rootBundle.loadString(_assetPath);
      final List<dynamic> jsonList = json.decode(jsonString);
      final tips = <Tip>[];

      for (final jsonItem in jsonList) {
        try {
          final tip = Tip.fromJson(jsonItem);
          tips.add(tip);
        } catch (_) {
          // Skip invalid entries
        }
      }

      return Result.success(tips);
    } catch (e) {
      return Result.failure('Failed to load tips: $e');
    }
  }
}
