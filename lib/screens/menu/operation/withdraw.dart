import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../../components/methods/app_header.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: withdrawMobile(),
        tablet: withdrawTablet(),
        desktop: withdrawDesktop());
  }

  Widget withdrawMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("withdraw"),
        ),
        body: const Center(
          child: Text("withdraw Mobile"),
        ));
  }

  Widget withdrawTablet() {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(
            title: "withdraw",
            leadingIcon: Icons.home,
          ),
          Center(
            child: Text("withdraw Desktop"),
          ),
        ],
      ),
    );
  }

  Widget withdrawDesktop() {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(
            title: "withdraw",
            leadingIcon: Icons.home,
          ),
          Center(
            child: Text("withdraw Desktop"),
          ),
        ],
      ),
    );
  }
}
