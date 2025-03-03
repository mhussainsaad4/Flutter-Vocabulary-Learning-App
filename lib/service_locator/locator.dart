import 'package:get_it/get_it.dart';

import '../database/app_database.dart';

GetIt locator = GetIt.instance;

void appSetup() {
  locator.registerLazySingleton(() => AppDatabase());
}
