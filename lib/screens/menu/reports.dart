import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

import '../../components/methods/app_header.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: reportMobile(), tablet: reportTablet(), desktop: reportDesktop());
  }
  Widget reportMobile(){
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
      ),
        body: Text("Report Mobile"));
  }
  Widget reportTablet(){
    return const Scaffold(body: Text("Report Tablet"));
  }
  Widget reportDesktop(){
    return Scaffold(body: Column(
      children: [
        AppHeader(title: "reports",leadingIcon: Icons.report),

        Text("Report Desktop"),
      ],
    ));
  }


}
