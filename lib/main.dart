import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/screens/home_screen.dart';
import 'package:zaitoontech/screens/users/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  //   await WindowManager.instance.setFullScreen(true);
  //   await WindowManager.instance.setFullScreen(false);
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
        Locale('ar'),
      ],
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const ZaitoonApp()));
}

class ZaitoonApp extends StatelessWidget {
  const ZaitoonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(XController());
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Zaitoon Tech',
      theme: ThemeData(
        hoverColor: kBlue.withOpacity(.05),
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: kBlue,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
          )),
      home: GetBuilder<XController>(
        builder: (context) {
          return controller.isLoginSucceed? const HomeScreen(): const LoginScreen();
        }
      ),
    );
  }
}
