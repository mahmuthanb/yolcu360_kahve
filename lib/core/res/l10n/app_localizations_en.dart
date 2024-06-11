import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appearance => 'Appearance';

  @override
  String get dark => 'Dark';

  @override
  String get home => 'Home';

  @override
  String get language => 'Language';

  @override
  String get licenses => 'Licenses';

  @override
  String get light => 'Light';

  @override
  String get settings => 'Settings';

  @override
  String get systemDefault => 'System Default';

  @override
  String get version => 'Version';

  @override
  String get lblPrice => 'Price';

  @override
  String get lblBuyNow => 'Buy Now';

  @override
  String get lblReadMore => 'Read More';

  @override
  String get lblReadLess => 'Read Less';

  @override
  String get lblDetailDescription => 'Description';

  @override
  String get lblDetailSize => 'Size';

  @override
  String lblProductIngredients(Object desc) {
    return 'with $desc';
  }

  @override
  String get lblOrderDeliveryAdress => 'Delivery Address';

  @override
  String get lblOrderPaymentSummary => 'Payment Summary';

  @override
  String get lblOrderPaymentDeliveryFee => 'Delivery Fee';

  @override
  String lblOrderPaymentDiscount(Object count) {
    return '$count Discount is applied';
  }

  @override
  String get lblOrderEditAddress => 'Edit Address';

  @override
  String get lblOrderAddNote => 'Add Note';

  @override
  String get lblHomeLocation => 'Location';

  @override
  String get lblHomeSearchBox => 'Search coffee';

  @override
  String get lblNotFoundPage => 'The page you are looking for can not be found or might be deleted';

  @override
  String get ttlNotFoundPage => 'Page Not Found';

  @override
  String get ttlOrderPage => 'Order';

  @override
  String get ttlDetailPage => 'Detail';
}
