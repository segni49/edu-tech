import 'package:flutter/foundation.dart';

enum Category {
  energy,
  food,
  waste,
  water,
  transport,
  home,
  community,
}

class Tip {
  final String id;
  final String title;
  final String action;
  final String impact;
  final Category category;

  Tip({
    required this.id,
    required this.title,
    required this.action,
    required this.impact,
    required this.category,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null || json['title'] == null || json['action'] == null || json['impact'] == null || json['category'] == null) {
      throw ArgumentError('Missing required fields in Tip JSON');
    }

    final id = json['id'] as String;
    final title = json['title'] as String;
    final action = json['action'] as String;
    final impact = json['impact'] as String;
    final categoryStr = (json['category'] as String).toLowerCase();

    if (id.isEmpty || title.isEmpty || action.isEmpty || impact.isEmpty || categoryStr.isEmpty) {
      throw ArgumentError('Empty string in required fields of Tip JSON');
    }

    Category? category;
    switch (categoryStr) {
      case 'energy':
        category = Category.energy;
        break;
      case 'food':
        category = Category.food;
        break;
      case 'waste':
        category = Category.waste;
        break;
      case 'water':
        category = Category.water;
        break;
      case 'transport':
        category = Category.transport;
        break;
      case 'home':
        category = Category.home;
        break;
      case 'community':
        category = Category.community;
        break;
      default:
        throw ArgumentError('Invalid category: $categoryStr');
    }

    if (title.length > 120) {
      throw ArgumentError('Title exceeds max length of 120 characters');
    }

    if (action.length > 500) {
      throw ArgumentError('Action exceeds max length of 500 characters');
    }

    if (impact.length > 300) {
      throw ArgumentError('Impact exceeds max length of 300 characters');
    }

    return Tip(
      id: id,
      title: title,
      action: action,
      impact: impact,
      category: category,
    );
  }
}
