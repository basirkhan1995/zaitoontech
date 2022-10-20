import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: contactUsMobile(), tablet: contactUsTablet(), desktop: contactUsDesktop());
  }
  Widget contactUsMobile(){
    return  Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.contact_phone_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("contact").tr(),
        ),
        body: const Text("contactUs Tablet"));
  }
  Widget contactUsTablet(){
    return  Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.contact_phone_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("contact").tr(),
        ),
        body: const Text("contactUs Tablet"));
  }
  Widget contactUsDesktop(){
    return  Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.contact_phone_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("contact").tr(),
        ),
        body: const Text("contactUs Tablet"));
  }


}
