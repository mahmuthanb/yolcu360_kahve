import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

extension DateTimeEx on DateTime {
  String dateFormat() {
    return DateFormat("dd.MM.yyyy").format(this);
  }
}

extension PriceFormatter on int {
  String currencyFormat() {
    String price = toStringAsFixed(2);
    return '\$ $price';
  }
}

extension PriceFormatterDouble on double {
  String currencyFormatDb() {
    String price = toStringAsFixed(2);
    return '\$ $price';
  }
}

extension ListStringFormatter on List<String> {
  String convertListtoString() {
    return join(', ');
  }
}

extension LatLngExt on LatLng {
  String stringify() => '$longitude,$latitude';
}
