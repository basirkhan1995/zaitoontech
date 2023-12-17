
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:zaitoontech/Components/Colors/colors.dart';


class ZButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final double height;
  final double width;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? radius;
  const ZButton({Key? key,
    required this.onTap,
    required this.label,
    this.fontSize,
    this.width = .9,
    this.height = 50,
    this.radius = 8,
    this.backgroundColor = primaryColor,
    this.labelColor = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
      width: MediaQuery.of(context).size.width * width,
      height: height,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        onPressed: onTap,
        child: LocaleText(label,style: TextStyle(color: labelColor,fontSize: fontSize)),
      ),
    );
  }
}
