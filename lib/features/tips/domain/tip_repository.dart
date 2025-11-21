import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/features/tips/data/tip_loader.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';

final tipsProvider = FutureProvider<List<Tip>>((ref) async {
  final loader = TipLoader();
  final result = await loader.loadTips();
  if (result.isSuccess) {
    return result.value!;
  } else {
    throw Exception(result.error);
  }
});

final selectedCategoryProvider = StateProvider<Category>((ref) => Category.values.first);
