import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appearance => 'Tema';

  @override
  String get dark => 'Koyu';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get language => 'Dil';

  @override
  String get licenses => 'Lisanslar';

  @override
  String get light => 'Parlak';

  @override
  String get settings => 'Ayarlar';

  @override
  String get systemDefault => 'Sistem Varsayılan';

  @override
  String get version => 'Versiyon';

  @override
  String get lblPrice => 'Fiyat';

  @override
  String get lblBuyNow => 'Hemen Al';

  @override
  String get lblReadMore => 'Daha Fazla';

  @override
  String get lblReadLess => 'Daha Az';

  @override
  String get lblDetailDescription => 'Açıklama';

  @override
  String get lblDetailSize => 'Boy';

  @override
  String lblProductIngredients(Object desc) {
    return '$desc ile';
  }

  @override
  String get ttlOrderPage => 'Sipariş';

  @override
  String get ttlDetailPage => 'Detay';
}
