import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:zaitoontech/Components/Methods/responsive.dart';

class Signup extends StatelessWidget {
  final int? type;
  const Signup({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenLayout(
          mobile: mobile(),
          tablet: tablet(),
          desktop: desktop(),
        )
    );
  }

  Widget mobile(){
    return const Center(
      child: LocaleText("signup mobile"),
    );
  }

  Widget tablet(){
    return const Center(
      child: LocaleText("signup tablet"),
    );
  }

  Widget desktop(){
    return Center(
      child: LocaleText(type.toString()),
    );
  }


}
