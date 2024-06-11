// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:yolcu360_kahve/bootstrap.dart';
import 'package:yolcu360_kahve/feature/page/app/app.dart';

void main() async {
  bootstrap(() => const App(), Environment.prod);
}
