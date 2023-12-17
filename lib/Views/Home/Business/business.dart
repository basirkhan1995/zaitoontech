import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:zaitoontech/Components/Methods/responsive.dart';

class BusinessHome extends StatelessWidget {
  const BusinessHome({super.key});

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
      child: LocaleText("business mobile"),
    );
  }

  Widget tablet(){
    return const Center(
      child: LocaleText("business tablet"),
    );
  }

  Widget desktop(){
    return const Center(
      child: LocaleText("business desktop"),
    );
  }


}
