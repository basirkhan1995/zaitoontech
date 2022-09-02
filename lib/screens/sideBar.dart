import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/expansionTile.dart';
import 'package:zaitoontech/components/methods/menu_screens.dart';
import 'package:zaitoontech/screens/users/login.dart';
import '../components/function_methods/env.dart';


class SideBar extends StatefulWidget {
  final double maxWidth;
  final double minWidth;
  final double selectedIconSize;
  final Color selectedItemColor;
  final Color? unSelectedItemColor;
  final double iconSize;
  final double fontSize;
  const SideBar({
    Key? key,
    this.minWidth = 120,
    this.maxWidth = 255,
    this.selectedIconSize = 30,
    this.iconSize = 26,
    this.fontSize = 13,
    this.selectedItemColor = kBlue,
    this.unSelectedItemColor = kGrey,
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final controller = Get.put(XController());
  final xStorage = GetStorage();
  bool isExtended = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState(){
    controller.getUserDetailsState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          color: Colors.transparent,
          duration: const Duration(milliseconds: 400),
          width: isExtended ? widget.maxWidth : widget.minWidth,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
            child: Drawer(
              backgroundColor: kWhite,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  //Heading
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isExtended
                          ? Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const CircleAvatar(
                                      radius: 34,
                                      backgroundColor: kBlue,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/ghufran.jpg"),
                                        radius: 32,
                                        backgroundColor: kWhite,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                          children: [
                                            Text(
                                              "${controller.firstName} ${controller.lastName}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(controller.userRole).tr(),
                                          ],
                                        )

                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      IconButton(
                          splashRadius: 18,
                          onPressed: () {
                            setState(() {
                              isExtended = !isExtended;
                            });
                          },
                          icon: isExtended
                              ? const Icon(Icons.close,size: 20)
                              : const Icon(
                                  Icons.menu,
                                  color: kBlue,
                                  size: 24,
                                )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  isExtended
                      ? const Divider(endIndent: 40, indent: 40, thickness: 0.5)
                      : const SizedBox(),

                  //Expansion Tile
                  Expanded(
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: _scrollController,
                      //shrinkWrap: true,
                      children: [

                        //Dashboard Screen
                        tile("home", Icons.home, 0, 0),
                        ExpansionMenu(
                            title: isExtended? "operation":"",
                            leading: Icons.add_chart_rounded,
                            children: [
                            tile("stakeholders", Icons.circle_outlined, 2, 2),
                              tile("withdraw", Icons.circle_outlined, 21, 21),
                              tile("deposit", Icons.circle_outlined, 22, 22),

                          ],
                        ),
                        ExpansionMenu(
                          title: isExtended? "finance":"",
                          leading: Icons.paid,
                          children: [
                            tile("balance_transfer", Icons.circle_outlined, 1, 1),
                            tile("money_exchange", Icons.circle_outlined, 2, 2),
                            tile("mnu_system_acc", Icons.circle_outlined, 3, 3),
                          ],
                        ),
                        ExpansionMenu(
                          title: isExtended? "hr":"",
                          leading: Icons.home_repair_service,
                          children: [
                            tile("new_employee", Icons.circle_outlined, 3, 3),
                            tile("users", Icons.circle_outlined, 31, 31),
                            tile("salary", Icons.circle_outlined, 32, 32),
                          ],
                        ),
                        ExpansionMenu(
                          title: isExtended? "transport":"",
                          leading: Icons.fire_truck,
                          children: [
                            tile("consignments", Icons.circle_outlined, 1, 1),
                            tile("new consign", Icons.circle_outlined, 2, 2),
                            tile("add_item", Icons.circle_outlined, 3, 3),
                          ],
                        ),
                        ExpansionMenu(
                          title: isExtended? "reports":"",
                          leading: Icons.info,
                          children: [
                            tile("annually", Icons.circle_outlined, 4, 4),
                            tile("monthly", Icons.circle_outlined, 2, 2),
                            tile("weekly", Icons.circle_outlined, 3, 3),
                          ],
                        ),

                        tile("settings", Icons.settings, 5, 5),
                      ],
                    ),
                  ),

                  //Trailing
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        !isExtended
                            ? Divider(
                                endIndent: 10,
                                indent: 10,
                                thickness: 0.5,
                                color: kGrey.withOpacity(.4))
                            : const SizedBox(),
                        !isExtended
                            ? const CircleAvatar(
                                radius: 30,
                                backgroundColor: kBlue,
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      AssetImage("assets/ghufran.jpg"),
                                  backgroundColor: kWhite,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    leading: const Icon(
                                        Icons.power_settings_new_outlined,
                                        color: kBlue),
                                    trailing: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset('assets/zaitoonLogo.jpg')),
                                    onTap: () {
                                      controller.logout();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                                              (Route<dynamic> route) => false);

                                    }),
                              ),
                        const SizedBox(height: 5)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        //Routes
        Expanded(
          child: GetBuilder<XController>(builder: (context) {
            return SizedBox(
              child: Center(child: MenuScreens(id: controller.menuID)),
            );
          }),
        ),

      ],
    );
  }

  Widget tile(String title, IconData leading, int index, int routeID) {
    bool selected = Env.selectedIndex == index;
    return isExtended
        ? Center(
            child: Padding(
            padding: const EdgeInsets.only(left: 11, right: 11),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: selected ? kBlue.withOpacity(.05) : Colors.transparent,
              ),
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 13),
                  hoverColor: kBlue.withOpacity(.08),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  selected: selected,
                  title: Text(title,
                          style: TextStyle(
                              color: selected
                                  ? widget.selectedItemColor
                                  : widget.unSelectedItemColor,
                              fontWeight: selected ? FontWeight.w500 : null,
                              fontSize: 12))
                      .tr(),
                  leading: Icon(leading,
                      color: selected
                          ? widget.selectedItemColor
                          : widget.unSelectedItemColor,
                      size: selected ? 24 : 20),
                  onTap: () => setState(() {
                        Env.selectedIndex = index;
                        controller.setRoute(routeID);
                      })),
            ),
          ))
        : Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected ? kBlue.withOpacity(.05) : Colors.transparent,
                ),
                child: ListTile(
                    selected: selected,
                    subtitle: Center(
                        child: Text(selected ? title : "",
                                style: TextStyle(
                                    color: selected
                                        ? widget.selectedItemColor
                                        : widget.unSelectedItemColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                            .tr()),
                    title: Icon(
                      leading,
                      color: selected
                          ? widget.selectedItemColor
                          : widget.unSelectedItemColor,
                      size: selected ? 24 : 20,
                    ),
                    onTap: () => setState(() {
                          Env.selectedIndex = index;
                          controller.setRoute(routeID);
                        })),
              ),
            ),
          );
  }
}
