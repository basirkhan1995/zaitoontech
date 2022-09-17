import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/methods/app_header.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: contactUsMobile(), tablet: contactUsTablet(), desktop: contactUsDesktop());
  }
  Widget contactUsMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("contact").tr(),
        ),
        body: const Text("contactUs Mobile"));
  }
  Widget contactUsTablet(){
    return  Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.contact_phone_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("contact").tr(),
        ),
        body: const Text("contactUs Tablet"));
  }
  Widget contactUsDesktop(){
    return Scaffold(
        body: Column(
      children: const [
        AppHeader(title: "contact",leadingIcon: Icons.arrow_back_ios_new_outlined, routeIndex: 5),
        Text("contactUs desktop"),
      ],
    ));
  }


}
