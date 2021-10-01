import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/service/app_localization.dart';
import 'core/service/fiexedservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocals(BuildContext context, Locale? local) {
    _MyAppState? state = context.findRootAncestorStateOfType<_MyAppState>();
    state!.setlocale(local);
  } // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  void setlocale(Locale? loc) {
    setState(() {
      _locale = loc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: FixedService.primColor,
        fontFamily: FixedService.fontregular.fontFamily,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontFamily: FixedService.fontregular.fontFamily,
          ),
          bodyText1: TextStyle(
            fontSize: 25,
            fontFamily: FixedService.fontregular.fontFamily,
          ),
        ),
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
        Locale('tr', 'TR'),
      ],
      locale: _locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (local, supportedLocals) {
        for (var loc in supportedLocals) {
          if (loc.countryCode == local!.countryCode &&
              loc.languageCode == local.languageCode) {
            return loc;
          }
        }
        return supportedLocals.first;
      },
      initialRoute: FixedService.splash,
      routes: FixedService.routes,
    );
  }
}
