import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final name = locale.countryCode?.isEmpty ?? true ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    await Intl.load(localeName);
    return AppLocalizations();
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get appTitle => Intl.message('Eco Tips', name: 'appTitle');
  String get categoryAll => Intl.message('All', name: 'categoryAll');
  String get categoryEnergy => Intl.message('Energy', name: 'categoryEnergy');
  String get categoryFood => Intl.message('Food', name: 'categoryFood');
  String get categoryWaste => Intl.message('Waste', name: 'categoryWaste');
  String get categoryWater => Intl.message('Water', name: 'categoryWater');
  String get categoryTransport => Intl.message('Transport', name: 'categoryTransport');
  String get categoryHome => Intl.message('Home', name: 'categoryHome');
  String get categoryCommunity => Intl.message('Community', name: 'categoryCommunity');
  String get favorites => Intl.message('Favorites', name: 'favorites');
  String get addToFavorites => Intl.message('Add to favorites', name: 'addToFavorites');
  String get removeFromFavorites => Intl.message('Remove from favorites', name: 'removeFromFavorites');
  String get tipDetailAction => Intl.message('Action', name: 'tipDetailAction');
  String get tipDetailImpact => Intl.message('Why it matters', name: 'tipDetailImpact');
  String get noTipsFound => Intl.message('No tips found for this category.', name: 'noTipsFound');
  String get loading => Intl.message('Loading...', name: 'loading');
  String errorLoadingTips(String error) => Intl.message('Error loading tips: $error', name: 'errorLoadingTips', args: [error]);
  String get searchHint => Intl.message('Search tips by title', name: 'searchHint');
  String get favoritesFilter => Intl.message('Favorites', name: 'favoritesFilter');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'am'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
