import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:zaitoontech/Components/Colors/colors.dart';
import 'package:zaitoontech/Views/Authentication/Login/login.dart';

import 'Components/Providers/ui_provider.dart';
import 'Env/env.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'ar']);

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..initialize(),
      child: Consumer<UiProvider>(
        builder: (context,UiProvider notifier, child) {
          return LocaleBuilder(
            builder: (locale) {
              return MaterialApp(
                title: 'ZaitoonTech',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    foregroundColor: primaryColor
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  fontFamily: locale.toString() == "en"?"Ubuntu":"Dubai",
                  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
                  useMaterial3: true,
                  primarySwatch: Env.buildMaterialColor(const Color(0xFF535b3b))
                ),
                home: const LoginScreen(),
              );
            }
          );
        }
      ),
    );
  }
}

