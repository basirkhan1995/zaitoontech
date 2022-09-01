import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? leading;
  final VoidCallback? onTap;
  const CustomCard({Key? key,this.title, this.subtitle, this.leading,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hoverColor: kBlue.withOpacity(.08),
        onTap: onTap,
        title: Text(title!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600)).tr(),
        subtitle: Text(subtitle!,style: const TextStyle(fontSize: 14)).tr(),
        leading: Icon(leading,size: 24),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 14),

      ),
    );
  }
}
