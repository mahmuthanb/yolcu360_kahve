import 'package:yolcu360_kahve/bootstrap.dart';
import 'package:yolcu360_kahve/feature/page/app/app.dart';
import 'package:injectable/injectable.dart';

void main() async {
  bootstrap(() => const App(), Environment.dev);
}
