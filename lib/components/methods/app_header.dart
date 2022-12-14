import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import '../colors/colors.dart';
import '../function_methods/env.dart';


class AppHeader extends StatefulWidget {
  final String? title;
  final IconData? leadingIcon;
  final int? routeIndex;
  final double appHeight;
  final VoidCallback? onSearch;
  final Color? backgroundColor;
  final String? searchHint;
  final ValueChanged<String>?onChanged;
  const AppHeader({Key? key,this.backgroundColor = Colors.white, this.appHeight = 55, this.title,this.searchHint = 'search', this.onSearch,this.onChanged, this.leadingIcon, this.routeIndex})
      : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  final controller = Get.put(XController());
  @override
  void initState() {
    controller.getUserDetailsState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      // scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 8.0),
        child: Container(
          decoration: BoxDecoration(
           border: Border.all(color: Colors.blueGrey.shade100),
              boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0),
          ], color: widget.backgroundColor, borderRadius: BorderRadius.circular(10)
              //borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
              ),
          width: MediaQuery.of(context).size.width,
          height: widget.appHeight,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      splashRadius: 10,
                      onPressed: () => controller.setRoute(widget.routeIndex!),
                      icon: Icon(widget.leadingIcon, size: 18),
                    ),
                    const SizedBox(width: 5),
                    Text(widget.title!,
                        style: const TextStyle(fontWeight: FontWeight.bold)).tr(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    headingRow(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headingRow(context) {
    final controller = Get.put(XController());
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
         mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: Env.searchOn? Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                     Container(
                       decoration: BoxDecoration(
                         color: kBlue.withOpacity(.08),
                         borderRadius: BorderRadius.circular(10)
                       ),
                       width: 200,
                       height: 40,
                       child: TextField(
                         controller: Env.searchTextController,
                         onChanged: widget.onChanged,
                         decoration: InputDecoration(
                           contentPadding: const EdgeInsets.all(8.0),
                           hintText: widget.searchHint,
                           prefixIcon: const Icon(Icons.search,color: kBlue,),
                           border: InputBorder.none,
                           suffixIcon: Env.searchTextController.text.isNotEmpty? IconButton(
                             splashRadius: 15,
                              onPressed: (){
                               setState(() {

                               });
                             Env.searchTextController.clear();
                           }, icon: const Icon(Icons.clear,size: 16,color: kBlue,),
                       ):null,
                         ),
                       ),
                     ),
                  ],
                ) : IconButton(
                  tooltip: tr("search"),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: widget.onSearch,
                  icon: const Icon(Icons.search),
                )
              ),
            ),
            controller.menuID ==6? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  tooltip: tr("add_product"),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: () {
                    controller.setRoute(61);
                  },
                  icon: const Icon(Icons.add_circle_outlined),
                ),
              ),
            ):const SizedBox(),
           controller.menuID ==31? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  tooltip: tr("add_user"),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: () {
                    controller.setRoute(3);
                  },
                  icon: const Icon(Icons.add_circle_outlined),
                ),
              ),
            ):const SizedBox(),
            controller.menuID ==2? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  tooltip: tr("add_stakeholder"),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: () {
                    controller.setRoute(3);
                  },
                  icon: const Icon(Icons.add_circle),
                ),
              ),
            ):const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  tooltip: tr('home'),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: () => controller.setRoute(0),
                  icon: const Icon(Icons.home),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              child: IconButton(
                tooltip: tr('language'),
                  splashColor: kBlue.withOpacity(.05),
                  splashRadius: 20,
                  onPressed: () =>
                      Env.selectLanguageDialog(context,Env.selectedIndex),
                  icon: const Icon(Icons.language_sharp)),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  tooltip: tr('settings'),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: () {
                    controller.setRoute(5);
                  },
                  icon: const Icon(Icons.settings),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: IconButton(
                  tooltip: tr('logout'),
                  splashRadius: 20,
                  splashColor: kBlue.withOpacity(.05),
                  onPressed: () => controller.logout(context),
                  icon: const Icon(Icons.power_settings_new_outlined),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: Text(controller.userRole).tr(),
                            children: [
                              ListTile(
                                leading:
                                    const Icon(Icons.account_circle, size: 28),
                                title: Text(
                                    "${controller.firstName} ${controller.lastName}"),
                              ),
                              ListTile(
                                leading: const Icon(
                                    Icons.alternate_email_outlined,
                                    size: 28),
                                title: Text(controller.userName),
                              ),
                              ListTile(
                                leading: const Icon(Icons.badge_rounded, size: 28),
                                title: Text(controller.branchName),
                              ),
                              ListTile(
                                leading: const Icon(Icons.important_devices_sharp,
                                    size: 28),
                                title: Text(controller.branchID),
                              ),
                            ],
                          ));
                },
                child: const CircleAvatar(
                  radius: 13,
                  backgroundImage: AssetImage("assets/ghufran.jpg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
