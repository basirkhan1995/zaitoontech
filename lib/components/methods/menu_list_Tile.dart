import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';

import '../colors/colors.dart';
import '../function_methods/env.dart';

class MenuListTile extends StatefulWidget {
  final bool isExtended;
  final int selectedIndex;
  final int? index;
  final int? routeID;
  final Color? selectedItemColor;
  final Color? unSelectedItemColor;
  final IconData? leading;
  final String? title;
  final double maxIconSize;
  final double minIconSize;
  const MenuListTile({Key? key,this.maxIconSize =20,this.minIconSize = 17, this.leading, this.title, this.unSelectedItemColor, this.isExtended = true,this.selectedIndex = 0, this.index,this.routeID,this.selectedItemColor}) : super(key: key);

  @override
  State<MenuListTile> createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {
  final controller = Get.put(XController());

  @override
  Widget build(BuildContext context) {
    bool selected = Env.selectedIndex == widget.index;
    return  widget.isExtended
        ? Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selected ? kBlue.withOpacity(.05) : Colors.transparent,
            ),
            child: ListTile(
              //contentPadding: const EdgeInsets.symmetric(horizontal: 9),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                hoverColor: kBlue.withOpacity(.08),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                selected: selected,
                title: Text(widget.title!,
                    style: TextStyle(
                        color: selected
                            ? widget.selectedItemColor
                            : widget.unSelectedItemColor,
                        fontWeight: selected ? FontWeight.w500 : null,
                        fontSize: 13))
                    .tr(),
                leading: Icon(widget.leading,
                    color: selected
                        ? widget.selectedItemColor
                        : widget.unSelectedItemColor,
                    size: selected ? widget.maxIconSize : widget.minIconSize),
                onTap: () => setState(() {
                  Env.selectedIndex = widget.index!;
                  controller.setRoute(widget.routeID!);
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
              selected: selected,
              subtitle: Center(
                  child: Text(selected ? widget.title! : "",
                      style: TextStyle(
                          color: selected
                              ? widget.selectedItemColor
                              : widget.unSelectedItemColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold))
                      .tr()),
              title: Icon(
                widget.leading,
                color: selected
                    ? widget.selectedItemColor
                    : widget.unSelectedItemColor,
                size: selected ? widget.maxIconSize : widget.minIconSize,
              ),
              onTap: () => setState(() {
                Env.selectedIndex = widget.index!;
                controller.setRoute(widget.routeID!);
              })),
        ),
      ),
    );
  }
}
