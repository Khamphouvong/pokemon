import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pokemon/core/configs/router/router.dart';
import 'package:pokemon/core/localization/generated/l10n.dart';

import 'core/configs/DI/config_dependencies.dart';

void main() async {
  await configDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        I10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I10n.delegate.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (supportedLocales
            .map((e) => e.languageCode)
            .contains(deviceLocale?.languageCode)) {
          return deviceLocale;
        } else {
          return const Locale('en', '');
        }
      },
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (settings) => AppRoute.routeGenerate(settings),
      initialRoute: AppRoute.initialRoute,
      //disable debug
      debugShowCheckedModeBanner: false,
    );
  }
}
