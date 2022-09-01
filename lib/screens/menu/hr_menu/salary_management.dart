import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

import '../../../components/methods/app_header.dart';

class SalaryManagement extends StatelessWidget {
  const SalaryManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: salaryManageMobile(), tablet: salaryManageTablet(), desktop: salaryManageDesktop());
  }
  Widget salaryManageMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("users"),
        ),
        body: const Text("Users Mobile"));
  }
  Widget salaryManageTablet(){
    return Scaffold(body: Text("Users Tablet"));
  }
  Widget salaryManageDesktop(){
    return Scaffold(body: Column(
      children: [
        AppHeader(title: "salary_management",leadingIcon: Icons.dashboard_customize_sharp),

        Center(child: Text("salaryManage Desktop")),
      ],
    ));
  }
}