import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: aboutAppMobile(),
        tablet: aboutAppTablet(context),
        desktop: aboutAppDesktop(context));
  }

  Widget aboutAppMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("about"),
        ),
        body: const Text("about Mobile"));
  }

  Widget aboutAppTablet(context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: const Icon(Icons.info),
          title: const Text("about").tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *.8,
            decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(color: Colors.blueGrey.shade100),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: Image.asset('assets/zLogo.png'),
                ),
                  Text("zaitoon",style: GoogleFonts.arvo(fontSize: 30,fontWeight: FontWeight.w700),).tr(),
                  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text("about_zaitoon",style: TextStyle(fontSize: 15),).tr(),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.whatsapp_rounded),
                        SizedBox(width: 5),
                        Icon(Icons.facebook_rounded),
                        SizedBox(width: 5),
                        Icon(Icons.email_rounded),
                        SizedBox(width: 5),
                        Icon(Icons.alternate_email)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget aboutAppDesktop(context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: const Icon(Icons.info),
          title: const Text("about").tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *.8,
            decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(color: Colors.blueGrey.shade100),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: Image.asset('assets/zLogo.png'),
                ),
                Text("zaitoon",style: GoogleFonts.arvo(fontSize: 30,fontWeight: FontWeight.w700),).tr(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text("about_zaitoon",style: TextStyle(fontSize: 15),).tr(),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.whatsapp_rounded),
                        SizedBox(width: 5),
                        Icon(Icons.facebook_rounded),
                        SizedBox(width: 5),
                        Icon(Icons.email_rounded),
                        SizedBox(width: 5),
                        Icon(Icons.alternate_email)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
