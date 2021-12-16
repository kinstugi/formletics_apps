import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/l10n/l10n.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/router/router_auth_guard.dart';
//import 'package:formletics/common/router/router_auth_guard.dart';
import 'package:formletics/common/themes/theme_helper.dart';
import 'package:formletics/features/app/ui/store/app_store.dart';
import 'package:formletics/features/login/ui/store/login_store.dart';
import 'package:formletics/common/router/router.gr.dart';
import 'package:formletics/constants/env.dart';
import 'package:formletics/constants/strings.dart';
import 'package:formletics/features/tabs/routine/data/providers/progress_photo_upload_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final AppStore _appStore = getIt<AppStore>();

  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return const Scaffold(
        body: Center(
          //child: Text(ln(context, 'error_message')),
          child: Text('Oops.. Some error occurred.'),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => getIt<LoginStore>(),
        ),
        Provider<AppStore>(
          create: (_) => _appStore,
        ),
        ChangeNotifierProvider.value(value: ProgressPhotoUploadProvider())
      ],
      child: Observer(
        builder: (context) {
          if (!_appStore.isAppSettingsLoaded) {
            return Center(
              child: Container(),
            );
          }
          return MaterialApp(
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: Env.data.debugShowCheckedModeBanner,
            debugShowMaterialGrid: Env.data.debugShowMaterialGrid,
            builder: (context, nativeNavigator) {
              setErrorBuilder();

              return ExtendedNavigator<Router>(
                initialRoute: Routes.splashScreen,
                router: Router(),
                // TODO REMOVE THIS COMMENT FOR ADD USER LOGIN2
                guards: [
                  RouterAuthGuard(),
                ],
                // TODO REMOVE THIS COMMENT FOR ADD USER LOGIN
              );
            },
            title: Strings.APP_NAME,
            theme: getAppThemeFromThemeMode(_appStore.theme.mode),
            locale: Locale(
              _appStore.language.locale,
              _appStore.language.countryCode,
            ),
            supportedLocales: supportedL10nLanguages
                .map(
                  (language) => Locale(language.locale, language.countryCode),
                )
                .toList(),
            localizationsDelegates: [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) {
                return supportedLocales.first;
              }

              // Check if the current device locale is supported
              return supportedLocales.firstWhere(
                (supportedLocale) =>
                    supportedLocale.languageCode == locale.languageCode,
                orElse: () => supportedLocales.first,
              );
            },
          );
        },
      ),
    );
  }
}
