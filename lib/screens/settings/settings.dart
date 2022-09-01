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
import '../../components/colors/colors.dart';
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
        child: Column(
          children: [
           AppHeader(title: "settings",leadingIcon: Icons.settings,routeIndex: 5,
                searchHint: "search_setting",
             onSearch: (){
               setState(() {
                 Env.searchOn = true;
               });
             },
                onChanged: (value){
                     setState(() {

                     });
                },
            ),
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
                            leading: Icons.account_circle,
                            subtitle: "account_info",
                            onTap: () {
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(51);
                            }
                          ),
                          CustomCard(
                            title: "language",
                            leading: Icons.language,
                            subtitle: Get.locale.toString(),
                            onTap: () => Env.selectLanguageDialog(context,VoidCallback),
                          ),
                          CustomCard(
                            leading: Icons.lock,
                            title: "privacy_settings",
                            subtitle: "role_management",
                            onTap: () {
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(52);
                            }
                          ),
                          CustomCard(
                            leading: Icons.security,
                            title: "security",
                            subtitle: "change_password",
                            onTap: (){
                              controller.subMenuExtended = !controller.subMenuExtended;
                              controller.setSubRoute(53);
                            }
                          ),
                          CustomCard(
                              leading: Icons.monetization_on,
                              title: "currency",
                              subtitle: "currency",
                              onTap: (){
                                controller.subMenuExtended = !controller.subMenuExtended;
                                controller.setSubRoute(56);
                              }
                          ),
                          CustomCard(
                            title: "contact_us",
                            leading: Icons.help,
                            subtitle: "contact",
                            onTap: () {
                              controller.subMenuExtended = !controller.subMenuExtended;
                               controller.setSubRoute(54);
                            },
                          ),
                          CustomCard(
                            title: "about",
                            leading: Icons.info,
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
                 Expanded(
                   flex: controller.subMenuExtended? 2 : 0,
                   child: GetBuilder<XController>(
                    builder: (context) {
                      return AnimatedContainer(
                         duration: const Duration(milliseconds: 500),
                        width: controller.subMenuExtended ? maxWidth : minWidth,
                        height: 620,
                         child: MenuScreens(id: controller.subMenuExtended? controller.subMenuID : 100),
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
                leading: Icons.account_circle,
                subtitle: "account_info",
                onTap: () => Get.to(const UserProfile()),
              ),
              CustomCard(
                title: "language",
                leading: Icons.language,
                subtitle: context.locale.toString(),
                onTap: () => Env.selectLanguageDialog(context,VoidCallback),
              ),
              GetBuilder<XController>(builder: (context) {
                return CustomCard(
                  leading: Icons.privacy_tip,
                  title: "privacy_settings",
                  subtitle: "role_management",
                  onTap: () => Get.to(const PrivacySettings()),
                );
              }),
              GetBuilder<XController>(builder: (context) {
                return CustomCard(
                  leading: Icons.security,
                  title: "security",
                  subtitle: "change_password",
                  onTap: () => Get.to(const ChangePassword()),
                );
              }),
              CustomCard(
                  leading: Icons.monetization_on,
                  title: "currency",
                  subtitle: "currency",
                  onTap: ()=> Get.to(const Currency()),
              ),
                CustomCard(
                title: "contact_us",
                leading: Icons.help,
                subtitle: "contact",
                  onTap: () => Get.to(const ContactUs()),
              ),
                CustomCard(
                title: "about",
                leading: Icons.info,
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
                leading: Icons.account_circle,
                subtitle: "account_info",
                onTap: ()=> Get.to(const UserProfile()),
              ),
              CustomCard(
                  title: "language",
                  leading: Icons.language,
                  subtitle: context.locale.toString(),
                  onTap: () {
                    Env.selectLanguageDialog(context,VoidCallback);
                  }),

                 CustomCard(
                  leading: Icons.privacy_tip,
                  title: "privacy_settings",
                  subtitle: "role_management",
                  onTap: ()=> Get.to(const PrivacySettings()),
                ),

              CustomCard(
                title: "security",
                leading: Icons.security,
                subtitle: "change_password",
                onTap: ()=> Get.to(const ChangePassword()),
              ),
              CustomCard(
                  leading: Icons.monetization_on,
                  title: "currency",
                  subtitle: "currency",
                onTap: ()=> Get.to(const Currency()),
              ),
              CustomCard(
                title: "contact_us",
                leading: Icons.help,
                subtitle: "contact",
                onTap: ()=> Get.to(const ContactUs()),
              ),
                CustomCard(
                title: "about",
                leading: Icons.info,
                subtitle: "app_info",
                onTap: ()=> Get.to(const AboutApp()),
              ),
            ],
          ),
        ));
  }
}
