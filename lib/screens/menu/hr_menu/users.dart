import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

import '../../../components/methods/app_header.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: usersMobile(), tablet: usersTablet(), desktop: usersDesktop());
  }
  Widget usersMobile(){
    return Scaffold(
      appBar: AppBar(
        title: const Text("users"),
      ),
        body: const Text("Users Mobile"));
  }
  Widget usersTablet(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("users"),
        ),
        body: const Text("Users Tablet"));
  }
  Widget usersDesktop(){
    return Scaffold(body: Column(
      children: const [
        AppHeader(title: "users",leadingIcon: Icons.dashboard_customize_sharp),

        Center(child: Text("Users Desktop")),
      ],
    ));
  }
}