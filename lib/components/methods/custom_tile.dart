import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final IconData? trailing;
  final IconData? leading;
  const CustomTile({Key? key,this.title,this.subTitle,this.trailing,this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leading),
      title: Text(title!,style: const TextStyle(fontWeight: FontWeight.w600),).tr(),
      subtitle: Text(subTitle!).tr(),
      trailing: Icon(trailing),
    );
  }
}
