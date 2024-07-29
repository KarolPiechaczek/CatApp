import 'package:first_flutter_app/cat_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<CatService>(CatService());
}