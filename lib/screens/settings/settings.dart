import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/custom_card.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import 'package:zaitoontech/screens/settings/about_app.dart';
import 'package:zaitoontech/screens/settings/change_password.dart';
import 'package:zaitoontech/screens/settings/contact_us.dart';
import 'package:zaitoontech/screens/settings/currency.dart';
import 'package:zaitoontech/screens/settings/privacy.dart';
import 'package:zaitoontech/screens/settings/profile_settings.dart';
import '../../components/function_methods/env.dart';
import '../../components/methods/app_header.dart';
import '../../components/methods/menu_screens.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = 0;
  double minWidth = 0;
  double maxWidth = 620;
  bool subExpanded = false;
  final controller = Get.put(XController());

  @override
  void initState() {
    controller.getUserDetailsState();
    super.initState();
  }
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: settingsMobile(),
        tablet: settingsTablet(),
        desktop: settingsDesktop(context));
  }

  Widget settingsDesktop(context) {
    //final controller = Get.put(XController());
    return Scaffold(
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const AppHeader(leadingIcon: Icons.settings,title: "settings"),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height *.9,
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        controller: _scrollController,
                        children: [
                          CustomCard(
                            title: "profile",
                            leading: const Icon(Icons.account_circle),
                            subtitle: "account_info",
                            onTap: () {
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(51);
                            }
                          ),
                          CustomCard(
                              title: "company_info",
                              leading: Image.asset('assets/appIcon/company.png'),
                              subtitle: "account_info",
                              onTap: () {
                                controller.subMenuExtended = !controller.subMenuExtended;
                                controller.setSubRoute(50);
                              }
                          ),
                          CustomCard(
                            title: "language",
                            leading: const Icon(Icons.language),
                            subtitle: Get.locale.toString(),
                            onTap: () => Env.selectLanguageDialog(context,VoidCallback),
                          ),
                          CustomCard(
                            leading: const Icon(Icons.lock),
                            title: "privacy_settings",
                            subtitle: "role_management",
                            onTap: () {
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(52);
                            }
                          ),
                          CustomCard(
                            leading: const Icon(Icons.security),
                            title: "security",
                            subtitle: "change_password",
                            onTap: (){
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(53);
                            }
                          ),
                          CustomCard(
                              leading: const Icon(Icons.monetization_on),
                              title: "currency",
                              subtitle: "currency",
                              onTap: (){
                                controller.subMenuExtended = !controller.subMenuExtended;
                                controller.setSubRoute(56);
                              }
                          ),
                          CustomCard(
                            title: "contact_us",
                            leading: const Icon(Icons.help),
                            subtitle: "contact",
                            onTap: () {
                              controller.subMenuExtended = !controller.subMenuExtended;
                               controller.setSubRoute(54);
                            },
                          ),
                          CustomCard(
                            title: "about",
                            leading: const Icon(Icons.info),
                            subtitle: "app_info",
                            onTap: (){
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(55);
                            },
                          ),

                          //


                        ],
                      ),
                    ),
                  ),
                ),
                //ُSub Display Window
                Expanded(
                   flex: 2,
                   child: GetBuilder<XController>(
                   builder: (context) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: maxWidth,
                        height: 1080,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          controller: _scrollController2,
                          child: SizedBox(
                            height: 700,
                              child: MenuScreens(id:controller.subMenuID)),
                        ),
                      );
                    }
                ),
                 ),
                const SizedBox(width:10),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget settingsTablet(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("settings").tr(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
               CustomCard(
                title: "profile",
                leading: const Icon(Icons.account_circle),
                subtitle: "account_info",
                onTap: () => Get.to(const UserProfile()),
              ),
              CustomCard(
                title: "language",
                leading: const Icon(Icons.language),
                subtitle: context.locale.toString(),
                onTap: () => Env.selectLanguageDialog(context,VoidCallback),
              ),
              GetBuilder<XController>(builder: (context) {
                return CustomCard(
                  leading: const Icon(Icons.privacy_tip),
                  title: "privacy_settings",
                  subtitle: "role_management",
                  onTap: () => Get.to(const PrivacySettings()),
                );
              }),
              GetBuilder<XController>(builder: (context) {
                return CustomCard(
                  leading: const Icon(Icons.security),
                  title: "security",
                  subtitle: "change_password",
                  onTap: () => Get.to(const ChangePassword()),
                );
              }),
              CustomCard(
                  leading: const Icon(Icons.monetization_on),
                  title: "currency",
                  subtitle: "currency",
                  onTap: ()=> Get.to(const Currency()),
              ),
                CustomCard(
                title: "contact_us",
                leading: const Icon(Icons.help),
                subtitle: "contact",
                  onTap: () => Get.to(const ContactUs()),
              ),
                CustomCard(
                title: "about",
                leading: const Icon(Icons.info),
                subtitle: "app_info",
                  onTap: () => Get.to(const AboutApp()),
              ),
            ],
          ),
        ));
  }

  Widget settingsMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("settings").tr(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
                CustomCard(
                title: "profile",
                leading: const Icon(Icons.account_circle),
                subtitle: "account_info",
                onTap: ()=> Get.to(const UserProfile()),
              ),
              CustomCard(
                  title: "language",
                  leading: const Icon(Icons.language),
                  subtitle: context.locale.toString(),
                  onTap: () {
                    Env.selectLanguageDialog(context,VoidCallback);
                  }),

                 CustomCard(
                  leading: const Icon(Icons.privacy_tip),
                  title: "privacy_settings",
                  subtitle: "role_management",
                  onTap: ()=> Get.to(const PrivacySettings()),
                ),

              CustomCard(
                title: "security",
                leading: const Icon(Icons.security),
                subtitle: "change_password",
                onTap: ()=> Get.to(const ChangePassword()),
              ),
              CustomCard(
                  leading: const Icon(Icons.monetization_on),
                  title: "currency",
                  subtitle: "currency",
                onTap: ()=> Get.to(const Currency()),
              ),
              CustomCard(
                title: "contact_us",
                leading: const Icon(Icons.help),
                subtitle: "contact",
                onTap: ()=> Get.to(const ContactUs()),
              ),
                CustomCard(
                title: "about",
                leading: const Icon(Icons.info),
                subtitle: "app_info",
                onTap: ()=> Get.to(const AboutApp()),
              ),
            ],
          ),
        ));
  }
}
