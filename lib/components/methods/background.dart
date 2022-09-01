
import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  final Widget? child;
  const Background({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      //width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(5.0, 5.0))
          ],
          image: DecorationImage(
              opacity: 100,
              fit: BoxFit.cover,
              image: AssetImage('assets/login_bg.jpg'))),
      child: child,
    );
  }
}