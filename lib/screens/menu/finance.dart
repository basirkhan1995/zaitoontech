import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

import '../../components/methods/app_header.dart';

class Finance extends StatelessWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: financeMobile(), tablet: financeTablet(), desktop: financeDesktop());
  }
  Widget financeMobile(){
    return Scaffold(
        appBar: AppBar(title: Text("Finance"),),
        body: Text("Finance Mobile"));
  }
  Widget financeTablet(){
    return Scaffold(
        appBar: AppBar(title: Text("Finance"),),
        body: Text("Finance Tablet"));
  }
  Widget financeDesktop(){
    return Scaffold(

        body: Column(
          children: [
            AppHeader(title: "finance",leadingIcon: Icons.paid),

            Text("Finance Desktop"),
          ],
        ));
  }
}