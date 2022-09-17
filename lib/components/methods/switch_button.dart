import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../colors/colors.dart';


class SwitchRole extends StatelessWidget {
  final bool? switchValue;
  final String? switchTitle;
  final ValueChanged? onChanged;
  final String? subTitle;
  const SwitchRole({Key? key,
    this.switchValue,this.switchTitle,this.onChanged,this.subTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 6.0, right: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.blueGrey.shade100
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SwitchListTile(
          title: Text(switchTitle!,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),).tr(),
          subtitle: Text(subTitle!,style: const TextStyle(fontSize: 14)).tr(),
          value:switchValue!,
          onChanged: onChanged,
          activeColor: kBlue,
        ),
      ),
    );
  }
}


