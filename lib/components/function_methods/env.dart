import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';

class Env {
  static final provider = Get.put(XController());
  static bool isChecked = false;
  static int currentIndex = 0;
  static int languageCurrentIndex = 0;
  static final firstName = TextEditingController();
  static final lastName = TextEditingController();
  static final cPhone = TextEditingController();
  static final uName = TextEditingController();
  static final uPassword = TextEditingController();
  static final searchTextController = TextEditingController();
  static final ScrollController scrollController = ScrollController();
  static bool searchOn = false;
  static int selectedIndex = 0;

  static appBar(title,VoidCallback press, IconData icon, Widget leading){
   return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              splashRadius: 20,
              splashColor: kGrey,
              focusColor: kGrey,
              hoverColor: kGrey.withOpacity(.7),
              onPressed: press, icon:  Icon(icon = Icons.edit,size: 20,)),
        )
      ],
      leading: leading,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      title: Text(title,style: const TextStyle(fontSize: 14)).tr(),
    );
  }

  //To Check Internet Connectivity
  static checkConnection(context, voidCallBack) async {
    try {
      final result = await InternetAddress.lookup('www.google.com')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('Connected');
        }
      }
    } on SocketException catch (_) {
      voidCallBack(() {
        //Env.loader = false;
      });
      // Env.errorDialog('No Internet Connection','لطفا انترنت خود را بررسی کنید', DialogType.ERROR, context, () { });
      if (kDebugMode) {
        print('No Connection');
      }
    } on TimeoutException catch (_) {
      await Future.delayed(const Duration(seconds: 6));
      voidCallBack(() {
        //Env.loader = false;
      });
      //Env.errorDialog('No internet connection', 'لطفا انترنت خود را بررسی کنید', DialogType.ERROR, context, () { });
      if (kDebugMode) {
        print('No Connection');
      }
    }
  }


  static jumpScreen(context, voidCallBack){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => voidCallBack,
      ),
    );
  }

  static heroAnimation(BuildContext context, String? image) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
              body: InkWell(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: Hero(
                    tag: 'my-hero-animation-tag',
                    child: Image.asset('assets/$image'),
                  ),
                ),
              ),
            )));
  }
  static void selectLanguageDialog(context,index){
     provider.selectedLanguage = languageCurrentIndex == index;
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("select_language").tr(),
        children: [
          ListTile(
            trailing: provider.selectedLanguage? const Icon(Icons.check, color: kBlue):null,
            title: const Text("English"),
            onTap: () {
                languageCurrentIndex = index;
                context.setLocale(const Locale("en"));
              Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: provider.selectedLanguage? const Icon(Icons.check, color: kBlue):null,
            title: const Text("فارسی"),
            onTap: () {
                languageCurrentIndex = index;
                context.setLocale( const Locale('fa'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: provider.selectedLanguage? const Icon(Icons.check, color: kBlue):null,
            title: const Text("پشتو"),
            onTap: () {
                languageCurrentIndex = index;
                context.setLocale( const Locale('ar'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  
}
