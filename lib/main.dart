import 'package:fegoz/Helper/theme.dart';
import 'package:fegoz/Model/LanguageModel.dart';
import 'package:fegoz/providers/demo_localization.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/providers/theme_provider.dart';
import 'package:fegoz/screens/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'Helper/constants.dart';
import 'Helper/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  Locale _locale;

  void setLocale(Locale temp) {
    setState(() {
      _locale = temp;
    });
  }

  @override
  void didChangeDependencies() {
    getLocales().then((locale) => {
          setState(() {
            this._locale = locale;
          }),
        });
    super.didChangeDependencies();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.changeTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (context, theme, child) {
          if (_locale == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return MaterialApp(
              title: kAppName,
              debugShowCheckedModeBanner: false,
              theme: themeData(context),
              darkTheme: darkThemeData(context),
              themeMode: theme.changeTheme ? ThemeMode.dark : ThemeMode.light,
              // transitionDuration: Duration(milliseconds: 300),
              //  defaultTransition: Transition.rightToLeftWithFade,
              localizationsDelegates: [
                DemoLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Language.supportedLocales,
              locale: _locale,
              localeResolutionCallback: (deviceLocale, supportdeLocales) {
                for (var local in supportdeLocales) {
                  if (local.languageCode == deviceLocale.languageCode &&
                      local.countryCode == deviceLocale.countryCode) {
                    return deviceLocale;
                  }
                }
                return supportdeLocales.first;
              },
              initialRoute: SplashScreen.routeName,
              routes: routes,
            );
          }
        },
      ),
    );
  }
}
