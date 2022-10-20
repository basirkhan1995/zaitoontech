import 'package:flutter/material.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import 'package:zaitoontech/screens/menu/dashboard.dart';
import 'package:zaitoontech/screens/home/sideBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: homeScreenMobile(),
        tablet: homeScreenTablet(),
        desktop: homeScreenDesktop());
  }

  Widget homeScreenMobile() {
    return Scaffold(
      drawer: const Drawer(),
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
    body: const Dashboard(),
    );
  }
  Widget homeScreenTablet() {
    XController().getUserDetailsState();
    return const Scaffold(
      body: SideBar(),
    );
  }
  Widget homeScreenDesktop() {
    XController().getUserDetailsState();
    return const Scaffold(
      body: SideBar(),
    );
  }
}
