import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../../components/methods/app_header.dart';

class NewEmployee extends StatelessWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: newEmployeeMobile(), tablet: newEmployeeTablet(), desktop: newEmployeeDesktop());
  }
  Widget newEmployeeMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("new_employee"),
        ),
        body: const Text("new Employee Mobile"));
  }
  Widget newEmployeeTablet(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("new_employee"),
        ),
        body:
    Text("New Employee Tablet"));
  }
  Widget newEmployeeDesktop(){
    return Scaffold(body: Column(
      children:const  [
        AppHeader(title: "new_employee",leadingIcon: Icons.dashboard_customize_sharp),

        Center(child: Text("newEmployee Desktop")),
      ],
    ));
  }
}