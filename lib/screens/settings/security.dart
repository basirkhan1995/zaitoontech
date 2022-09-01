import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/methods/app_header.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: securityMobile(), tablet: securityTablet(), desktop: securityDesktop());
  }
  Widget securityMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("security"),
        ),
        body: const Text("security Mobile"));
  }
  Widget securityTablet(){
    return  Scaffold(
        appBar: AppBar(
          title: const Text("security"),
        ),
        body: const Text("security Tablet"));
  }
  Widget securityDesktop(){
    return Scaffold(body: Column(
      children: const [
        AppHeader(title: "Security",leadingIcon: Icons.arrow_back_ios_new_outlined,routeIndex: 5),
        Text("Security desktop"),
      ],
    ));
  }


}
