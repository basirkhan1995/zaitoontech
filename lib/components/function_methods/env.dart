import 'package:easy_localization/easy_localization.dart';
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
  static bool searchOn = false;
  static int selectedIndex = 0;
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
                context.setLocale( const Locale('fa'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  
  static appBar (String title){
    return AppBar(
      iconTheme: const IconThemeData(
        color: kWhite,
      ),
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
      ),
      centerTitle: true,
      backgroundColor: kBlue,
      title: Text(title,style: const TextStyle(color: kWhite),).tr(),
    );
  }
  
}
