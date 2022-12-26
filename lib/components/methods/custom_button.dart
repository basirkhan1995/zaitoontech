import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../colors/colors.dart';

class Button extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  final double height;
  final double width;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? radius;
  const Button({Key? key,
    this.onTap,
    this.label,
    this.fontSize,
    this.width = .9,
    this.height = 50,
    this.radius = 10,
    this.backgroundColor = kBlue,
    this.labelColor = kWhite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        onPressed: onTap,
        child: Text(label!,style: TextStyle(color: labelColor,fontSize: fontSize)).tr(),
      ),
    );
  }
}
