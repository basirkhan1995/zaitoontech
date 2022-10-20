import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/custom_tile.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/colors/colors.dart';
import '../../components/function_methods/env.dart';


class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: userProfileMobile(), tablet: userProfileTablet(), desktop: userProfileDesktop());
  }
  Widget userProfileMobile(){
    final controller = Get.put(XController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
          ],
          title: const Text("profile").tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height:10),
                const CircleAvatar(
                  backgroundColor: kBlue,
                  radius: 55,
                  child: CircleAvatar(
                    radius: 53,
                    backgroundImage: AssetImage('assets/ghufran.jpg'),
                  ),
                ),
                Text("${controller.firstName} ${controller.lastName}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                Text(controller.email),
                Text(controller.userRole).tr(),
                const SizedBox(height:10),
                CustomTile(
                  title: "full_name",
                  subTitle: "${controller.firstName} ${controller.lastName}",
                  leading: Icons.account_circle,
                  trailing: Icons.info,
                ),
                CustomTile(
                  title: "email",
                  subTitle: controller.email,
                  leading: Icons.email,
                  trailing: Icons.info,
                ),
                CustomTile(
                  title: "phone",
                  subTitle: controller.phone,
                  leading: Icons.call,
                  trailing: Icons.info,
                ),
                const CustomTile(
                  title: "job_title",
                  subTitle: "General Manager",
                  leading: Icons.tips_and_updates_sharp,
                  trailing: Icons.info,
                ),

              ],
            ),
          ),
        ));
  }
  Widget userProfileTablet(){
    final controller = Get.put(XController());
    return  Scaffold(
        appBar:Env.appBar("profile", () { }, Icons.edit, const Icon(Icons.account_circle)),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(

            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height:10),
                const CircleAvatar(
                  backgroundColor: kBlue,
                  radius: 65,
                  child: CircleAvatar(
                    radius: 63,
                    backgroundImage: AssetImage('assets/ghufran.jpg'),
                  ),
                ),
                Text("${controller.firstName} ${controller.lastName}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),

                Text(controller.email),
                Text(controller.userRole).tr(),
                CustomTile(
                  title: "full_name",
                  subTitle: "${controller.firstName} ${controller.lastName}",
                  leading: Icons.account_circle,
                  trailing: Icons.info,
                ),
                CustomTile(
                  title: "company_name",
                  subTitle: controller.companyName,
                  leading: Icons.comment_bank_rounded,
                  trailing: Icons.info,
                ),
                CustomTile(
                  title: "email",
                  subTitle: controller.email,
                  leading: Icons.email,
                  trailing: Icons.info,
                ),
                CustomTile(
                  title: "phone",
                  subTitle: controller.phone,
                  leading: Icons.call,
                  trailing: Icons.info,
                ),
                  CustomTile(
                  title: "job_title",
                  subTitle: controller.userRole,
                  leading: Icons.tips_and_updates_sharp,
                  trailing: Icons.info,
                ),

              ],
            ),
          ),
        ));
  }
  Widget userProfileDesktop(){
    final controller = Get.put(XController());
    return Scaffold(
        appBar: Env.appBar("profile", () { }, Icons.edit, const Icon(Icons.account_circle)),
        body: Column(
      children:   [

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blueGrey.shade100),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height:10),
                  const CircleAvatar(
                    backgroundColor: kBlue,
                    radius: 65,
                    child: CircleAvatar(
                      radius: 63,
                      backgroundImage: AssetImage('assets/ghufran.jpg'),
                    ),
                  ),
                  Text("${controller.firstName} ${controller.lastName}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  Text(controller.email),
                  Text(controller.userRole).tr(),
                  CustomTile(
                    title: "full_name",
                    subTitle: "${controller.firstName} ${controller.lastName}",
                    leading: Icons.account_circle,
                    trailing: Icons.info,
                  ),
                  CustomTile(
                    title: "company_name",
                    subTitle: controller.companyName,
                    leading: Icons.comment_bank_rounded,
                    trailing: Icons.info,
                  ),
                  CustomTile(
                    title: "email",
                    subTitle: controller.email,
                    leading: Icons.email,
                    trailing: Icons.info,
                  ),
                  CustomTile(
                    title: "phone",
                    subTitle: controller.phone,
                    leading: Icons.call,
                    trailing: Icons.info,
                  ),
                  CustomTile(
                    title: "job_title",
                    subTitle: controller.userRole,
                    leading: Icons.tips_and_updates_sharp,
                    trailing: Icons.info,
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    ));
  }


}
