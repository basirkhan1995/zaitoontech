import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/screens/home/home_screen.dart';
import 'package:zaitoontech/screens/menu/finance.dart';
import 'package:zaitoontech/screens/menu/hr_menu/new_employee.dart';
import 'package:zaitoontech/screens/menu/hr_menu/salary_management.dart';
import 'package:zaitoontech/screens/menu/hr_menu/stakeholders.dart';
import 'package:zaitoontech/screens/menu/operation/deposit.dart';
import 'package:zaitoontech/screens/menu/operation/stakeholders.dart';
import 'package:zaitoontech/screens/menu/operation/withdraw.dart';
import 'package:zaitoontech/screens/settings/settings.dart';
import '../../screens/menu/hr_menu/users.dart';
import '../../screens/menu/reports.dart';
import '../../screens/users/login.dart';


class SideBarMobile extends StatefulWidget {
  final double maxWidth;
  final double minWidth;
  const SideBarMobile({Key? key, this.minWidth = 120, this.maxWidth = 260})
      : super(key: key);

  @override
  State<SideBarMobile> createState() => _SideBarMobileState();
}

class _SideBarMobileState extends State<SideBarMobile> {
  final controller = Get.put(XController());
  final xStorage = GetStorage();
  int selectedIndex = 0;

  @override
  void initState() {
    controller.getUserDetailsState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kWhite,
      elevation: 5,
      child: Column(
        children: [
          //Heading
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const CircleAvatar(
                          radius: 34,
                          backgroundColor: kBlue,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/ghufran.jpg"),
                            radius: 32,
                            backgroundColor: kWhite,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GetBuilder<XController>(
                          builder: (context) {
                            return Column(
                              children: [
                                 Text(
                                      "${controller.firstName} ${controller.lastName}",
                                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                    ),

                                Text(controller.email),
                                Text(controller.userRole).tr(),
                              ],
                            );
                          }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(endIndent: 10, indent: 10, thickness: 0.6),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                tile("home", Icons.home, 0, const HomeScreen()),
                Theme(data: ThemeData().copyWith( dividerColor: Colors.transparent,
                    hoverColor: kBlue.withOpacity(.06)),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.only(left:25, right: 25),
                    leading: const Icon(Icons.paid_rounded),
                    title: const Text( "finance"),
                    children: [
                      tile("finance", Icons.home, 1, const Finance()),
                    ],
                  ),
                ),
                Theme(data: ThemeData().copyWith( dividerColor: Colors.transparent,
                    hoverColor: kBlue.withOpacity(.06)),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.only(left:25, right: 25),
                    leading: const Icon(Icons.token_sharp),
                    title: const Text( "operation"),
                    children: [
                      tile("stakeholders", Icons.person, 2, const StakeHolders()),
                      tile("withdraw", Icons.access_time_filled, 2, const Withdraw()),
                      tile("deposit", Icons.paid_rounded, 2, const Deposit()),
                    ],
                  ),
                ),
                Theme(data: ThemeData().copyWith( dividerColor: Colors.transparent,
                    hoverColor: kBlue.withOpacity(.06)),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.only(left:25, right: 25),
                    leading: const Icon(Icons.paid_rounded),
                    title: const Text( "hr"),
                    children: [
                      tile("new_employee", Icons.person, 31, const NewEmployee()),
                      tile("users", Icons.account_circle, 32, const Users()),
                      tile("salary", Icons.paid, 33, const SalaryManagement()),
                      tile("new_stake", Icons.circle_outlined, 34, const MyUsers()),
                      tile("stakeholders", Icons.circle_outlined, 35, const StakeHolders()),
                      tile("salary", Icons.circle_outlined, 36, const SalaryManagement()),
                    ],
                  ),
                ),
                Theme(data: ThemeData().copyWith( dividerColor: Colors.transparent,
                    hoverColor: kBlue.withOpacity(.06)),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.only(left:25, right: 25),
                    leading: const Icon(Icons.fire_truck),
                    title: const Text( "transport"),
                    children: [
                      tile("consignments", Icons.trending_up, 2, const StakeHolders()),
                      tile("new_consign", Icons.create_new_folder, 2, const Withdraw()),
                      tile("add_item", Icons.add_shopping_cart_outlined, 2, const Deposit()),
                    ],
                  ),
                ),
                Theme(data: ThemeData().copyWith( dividerColor: Colors.transparent,
                    hoverColor: kBlue.withOpacity(.06)),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.only(left:25, right: 25),
                    leading: const Icon(Icons.paid_rounded),
                    title: const Text( "reports"),
                    children: [
                      tile("reports", Icons.report, 4, const Reports()),
                    ],
                  ),
                ),
                tile("settings", Icons.settings, 5, const Settings()),
              ],
            ),
          ),
          //Trailing
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Trailing
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: const Icon(
                          Icons.power_settings_new_outlined,
                          color: kBlue),
                      trailing: const Text(
                        "Logout",
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        controller.logout();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false);
                      }),
                ),
                //const SizedBox(height: 5)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tile(String title, IconData leading, int index, Widget route) {
    bool selected = selectedIndex == index;
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? kBlue.withOpacity(.05) : Colors.transparent,
        ),
        child: ListTile(
            selected: selected,
            title: Text(title,
                    style: TextStyle(
                        color: selected ? kBlue : kGrey,
                        fontWeight: selected ? FontWeight.w500 : null))
                .tr(),
            leading: Icon(
              leading,
              color: selected ? kBlue : kGrey,
              size: selected ? 30 : 23,
            ),
            onTap: () => setState(() {
                  selectedIndex = index;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => route));
                })),
      ),
    ));
  }
}
