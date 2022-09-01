import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../../components/methods/app_header.dart';

class StakeHolders extends StatelessWidget {
  const StakeHolders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: stakeholdersMobile(),
        tablet: stakeholdersDesktop(),
        desktop: stakeholdersDesktop());
  }

  Widget stakeholdersMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("stakeholders"),
        ),
        body: const Center(
          child: Text("stakeholders Mobile"),
        ));
  }

  Widget stakeholdersDesktop() {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(
            title: "Home",
            leadingIcon: Icons.home,
          ),
          Center(
            child: Text("stakeholders Desktop"),
          ),
        ],
      ),
    );
  }
}
