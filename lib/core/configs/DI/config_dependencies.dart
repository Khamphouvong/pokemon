import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/localization/generated/l10n.dart';

import 'config_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton(() => I10n());
  return getIt.init();
}
