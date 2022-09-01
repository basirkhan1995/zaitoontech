import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

import '../../components/methods/app_header.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: aboutAppMobile(), tablet: aboutAppTablet(), desktop: aboutAppDesktop());
  }
  Widget aboutAppMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("about"),
        ),
        body: const Text("about Mobile"));
  }
  Widget aboutAppTablet(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("about_app").tr(),
        ),
        body: Text("about Tablet"));
  }
  Widget aboutAppDesktop(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("about_app").tr(),
        ),
        body: Column(
      children: const [
        AppHeader(title: "about",leadingIcon: Icons.arrow_back_ios_new_outlined, routeIndex: 5),

        Text("about Desktop"),
      ],
    ));
  }


}
