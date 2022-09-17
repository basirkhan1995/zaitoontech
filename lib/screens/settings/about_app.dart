import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/methods/app_header.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: aboutAppMobile(),
        tablet: aboutAppTablet(context),
        desktop: aboutAppDesktop());
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
                  Text("ZAITOON",style: GoogleFonts.arvo(fontSize: 30,fontWeight: FontWeight.w700),),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Zaitoon Technology Services Company founded by Ghufran Ataie in 2020, the first project developed under Zaitoon services was called Beans Finance"
                      " Management System, which is used by greate companies and organization in Afghanistan.",style: TextStyle(fontSize: 15),),
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

  Widget aboutAppDesktop() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("about_app").tr(),
        ),
        body: Column(
          children: const [
            AppHeader(
                title: "about",
                leadingIcon: Icons.arrow_back_ios_new_outlined,
                routeIndex: 5),
            Text("about Desktop"),
          ],
        ));
  }
}
