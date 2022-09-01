import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../../components/methods/app_header.dart';

class Deposit extends StatelessWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: depositMobile(),
        tablet: depositTablet(),
        desktop: depositDesktop());
  }

  Widget depositMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("deposit"),
        ),
        body: const Center(
          child: Text("deposit Mobile"),
        ));
  }

  Widget depositTablet() {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(
            title: "deposit",
            leadingIcon: Icons.home,
          ),
          Center(
            child: Text("deposit Desktop"),
          ),
        ],
      ),
    );
  }

  Widget depositDesktop() {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(
            title: "deposit",
            leadingIcon: Icons.home,
          ),
          Center(
            child: Text("deposit Desktop"),
          ),
        ],
      ),
    );
  }
}
