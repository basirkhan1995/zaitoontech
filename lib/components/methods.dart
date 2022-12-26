import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Env {
  static const primaryNormal = Color(0xFF004d99);
  static const primaryLight = Color(0xFF004d99);
  static const primaryDark = Color(0x99004d99);
  static const hostUrl = "https://zaitoon.tech/API/";
  static const mobileWidth = 480;
  static const tabletWidth = 900;

  static visualLanguage(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: ()=> context.setLocale(const Locale('en','US')),
            child: const Text("English"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: ()=> context.setLocale(const Locale('fa','FA')),
            child: const Text("دری"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: ()=> context.setLocale(const Locale('ps','PS')),
            child: const Text("پشتو"),
          ),
        ),

      ],
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

  //Static AppBar
  static appBar(context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 17)),
    );
  }

  //Hero
  static void viewImage(BuildContext context, String imagePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => Scaffold(
              body: Center(
                  child: Hero(
                    tag: 'my-hero-animation-tag',
                    child: Image.asset('assets/photos/$imagePath'),
                  )),
            )));
  }

  //Goto
  static goto(route, context) {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => route));
  }

  //TextTile Rounded Design
  static box(title, context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        child: Column(
          children: [
            ListTile(
              onTap: () => switchLanguage(context),
              leading: Icon(
                Icons.language,
                size: 30,
                color: Colors.black.withOpacity(.4),
              ),
              title: Text(
                title,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(.8)),
              ),
              subtitle:
              const Text("Locales.currentLocale(context)!.languageCode"),
              trailing: const Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.4),
              offset: const Offset(1, 1), //(x,y)
              blurRadius: 2.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 78,
        width: size.width * .98,
      ),
    );
  }

  //Confirm Dialog
  static confirmDialog(title, message, VoidCallback press, context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )),
          backgroundColor: primaryLight.withOpacity(.9),
          elevation: 20,
          title: Text(title,
              style: const TextStyle(fontSize: 25, color: Colors.white)).tr(),
          actions: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )),
                ),
                onPressed: press,
                child: const Text("yes",
                    style: TextStyle(fontSize: 14, color: primaryNormal)).tr()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("no",
                    style: TextStyle(fontSize: 14, color: primaryNormal)).tr()),
          ],
          content: Text(message,
              style: const TextStyle(fontSize: 14, color: Colors.white)).tr(),
        ));
  }

//LOGIN FAILED DIALOG
  static zDialog(title, message, context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          backgroundColor: primaryLight.withOpacity(.9),
          elevation: 20,
          title: Text(title,style: const TextStyle(fontSize: 22, color: Colors.white)).tr(),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10
                        )),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("skip",
                      style: TextStyle(fontSize: 14, color: primaryNormal)).tr()),
            ),
          ],
          content: Text(message,
              style: const TextStyle(fontSize: 14, color: Colors.white)).tr(),
        ));
  }

  //Switch Language
  static void switchLanguage(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
        ),
        elevation: 10,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            minimum: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 180,
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.05),
                              borderRadius: BorderRadius.circular(40.0)),
                          child: const Icon(Icons.language,
                              color: Colors.grey, size: 25)),
                      title: const Text('English'),
                      onTap: () {
                        //Locales.change(context, 'en');
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            borderRadius: BorderRadius.circular(40.0)),
                        child: const Icon(Icons.language,
                            color: Colors.grey, size: 25)),
                    title: const Text('دری'),
                    onTap: () {
                      //Locales.change(context, 'fa');
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            borderRadius: BorderRadius.circular(40.0)),
                        child: const Icon(Icons.language,
                            color: Colors.grey, size: 25)),
                    title: const Text('پشتو'),
                    onTap: () {
                      //Locales.change(context, 'ps');
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Jump to other screens
  static jumpScreen(context, voidCallBack){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => voidCallBack,
      ),
    );
  }

  // Get user Data as String
  static Future<dynamic> getUserData(String key) async{
    SharedPreferences userData = await SharedPreferences.getInstance();
    String? result = userData.getString(key);
    return result!;
  }

}
