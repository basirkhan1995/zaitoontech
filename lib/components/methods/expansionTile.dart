import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';

import '../colors/colors.dart';

class ExpansionMenu extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final List<Widget>? children;
  final void items;
  final IconData? leading;
  final IconData? trailing;
  final double maxIconSize;
  final double fontSize;
  final double minIconSize;
  final double selectedIconSize;
  final Color selectedItemColor;
  final Color? unSelectedItemColor;
  const ExpansionMenu(
      {Key? key,
      this.title,
      this.subTitle,
      this.items,
      this.children,
      this.leading,
      this.trailing,
      this.selectedItemColor = kBlue,
      this.unSelectedItemColor,
      this.selectedIconSize = 24,
      this.maxIconSize = 22,
      this.minIconSize = 20,
      this.fontSize = 13})
      : super(key: key);

  @override
  State<ExpansionMenu> createState() => _ExpansionMenuState();
}

class _ExpansionMenuState extends State<ExpansionMenu>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  int _currIndex = 0;
  bool isExtended = true;
  int selectedIndex = 0;
  final controller = Get.put(XController());

  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
          dividerColor: Colors.transparent, hoverColor: kBlue.withOpacity(.06)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.only(right: 20, left: 24, bottom: 0, top: 0),
        onExpansionChanged: (value) {
          setState(() {
            _currIndex = _currIndex == 0 ? 1 : 0;
            isExpanded = !isExpanded;
          });
        },
        leading: Icon(
          widget.leading,
          size: isExpanded ? widget.maxIconSize : widget.minIconSize,
          color: isExpanded ? Colors.grey: Colors.grey,
        ),
        //subtitle: Text(widget.subTitle!),
        title: Text(
          widget.title!,
          style: TextStyle(
              color: isExpanded ? Colors.grey : Colors.grey,
              fontWeight: isExpanded ? FontWeight.w600 : FontWeight.w400,fontSize: 14),
        ).tr(),
        trailing: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, anim) => RotationTransition(
                  turns: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                      : Tween<double>(begin: 0.75, end: 1).animate(anim),
                  child: ScaleTransition(scale: anim, child: child),
                ),
            child: _currIndex == 0
                ? Icon(Icons.keyboard_arrow_down, size: 20,color: Colors.grey.withOpacity(.25), key: const ValueKey('icon1'))
                : Icon(Icons.close_sharp, size: 18,
                    key: const ValueKey('icon2'), color: Colors.grey.withOpacity(.25))),
        //trailing: !isExpanded? const Icon(Icons.keyboard_arrow_down): const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
        children: widget.children!,
      ),
    );
  }
}
