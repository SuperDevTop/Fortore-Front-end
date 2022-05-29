import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fortore/store/AppStore.dart';
import 'package:fortore/utils/LanguageChangeNotifierProvider.dart';
import 'package:fortore/utils/SharedPref.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'screens/splash_screen.dart';
import 'utils/AppConstants.dart';
import 'screens/deposit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SharedPref sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider<LanguageChangeNotifierProvider>(
        create: (context) => LanguageChangeNotifierProvider(),
        child: Builder(
            builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                String? langauge = await sharedPref.readSingleString("lang");
                if(langauge == null || langauge == "en"){
                  context.read<LanguageChangeNotifierProvider>().changeLocale("en");
                }else{
                  context.read<LanguageChangeNotifierProvider>().changeLocale("ar");
                }

              });
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    // GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Provider.of<LanguageChangeNotifierProvider>(context,
                          listen: true)
                      .getLocate,
                  title: appName,
                  theme: ThemeData(
                      scaffoldBackgroundColor: kBackgroundColor,
                      primaryColor: kBackgroundColor,
                      fontFamily: 'verdana',
                      canvasColor: kBackgroundColor),
                  home: const SplashScreen(),
                );
            })
  );
  }
}
