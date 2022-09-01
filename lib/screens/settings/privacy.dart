import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/methods/app_header.dart';
import '../../components/methods/switch_button.dart';

class PrivacySettings extends StatefulWidget {
  const PrivacySettings({Key? key}) : super(key: key);

  @override
  State<PrivacySettings> createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
  final controller = Get.put(XController());
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: privacyMobile(),
        tablet: privacyTablet(),
        desktop: privacyDesktop());
  }

  Widget privacyMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("privacy"),
        ),
        body: GetBuilder<XController>(builder: (context) {
          return Column(
              children: [
                const SizedBox(height: 5),

              ],
            );
        }));
  }

  Widget privacyTablet() {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.privacy_tip),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text("privacy", style: TextStyle(fontSize: 15)).tr(),
        ),
        body: GetBuilder<XController>(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SwitchRole(
                    switchTitle: "settings",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "finance",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "hr",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "security",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "privacy",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "language",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "help",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "help",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
                SwitchRole(
                    switchTitle: "help",
                    subTitle: controller.isSettings.toString(),
                    switchValue: controller.isSettings,
                    onChanged: (value) => controller.settingsSwitch(value)),
              ],
            ),
          );
        }));
  }

  Widget privacyDesktop() {
    return Scaffold(body: GetBuilder<XController>(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(
                leadingIcon: Icons.arrow_back_ios_rounded,
                title: "user_role_management",
                routeIndex: 5),
            const SizedBox(height: 5),
            SwitchRole(
                switchTitle: "help",
                subTitle: controller.isSettings.toString(),
                switchValue: controller.isSettings,
                onChanged: (value) => controller.settingsSwitch(value)),
          ],
        ),
      );
    }));
  }
}
