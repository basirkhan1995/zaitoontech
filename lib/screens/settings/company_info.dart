import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/custom_tile.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/colors/colors.dart';


class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: userProfileMobile(), tablet: userProfileDesktop(), desktop: userProfileDesktop());
  }
  Widget userProfileMobile(){
    final controller = Get.put(XController());
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/appIcon/org.png',color: Colors.white),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
          ],
          title: const Text("company_info").tr(),
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
                    backgroundImage: AssetImage('assets/zaitoonLogo.jpg'),
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
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  splashRadius: 20,
                  splashColor: kGrey,
                  focusColor: kGrey,
                  hoverColor: kGrey.withOpacity(.7),
                  onPressed: (){}, icon: const Icon(Icons.edit,size: 20,)),
            )
          ],
          leading: const Icon(Icons.account_circle),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          title: const Text("company_info",style: TextStyle(fontSize: 16)).tr(),
        ),
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
                    backgroundImage: AssetImage('assets/zaitoonLogo.jpg'),
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
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  splashRadius: 20,
                  splashColor: kGrey,
                  focusColor: kGrey,
                  hoverColor: kGrey.withOpacity(.7),
                  onPressed: (){}, icon: const Icon(Icons.edit,size: 20,)),
            )
          ],
          leading: Image.asset('assets/appIcon/company.png',color: kWhite,),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          title: const Text("company_info",style: TextStyle(fontSize: 16)).tr(),
        ),
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
                  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: const[
                         CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 65,
                           child: CircleAvatar(
                             radius: 63,
                             backgroundImage: AssetImage('assets/zaitoonLogo.jpg'),
                           ),
                         ),
                           SizedBox(width: 5),
                           CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 45,
                           child: CircleAvatar(
                             radius: 43,
                             backgroundImage: AssetImage('assets/farhad.jpg'),
                           ),
                         ),
                         SizedBox(width: 5),

                           CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 45,
                           child: CircleAvatar(
                             radius: 43,
                             backgroundImage: AssetImage('assets/mypic.jpg'),
                           ),
                         ),
                         SizedBox(width: 5),
                           CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 45,
                           child: CircleAvatar(
                             radius: 43,
                             backgroundImage: AssetImage('assets/pro.jpg'),
                           ),
                         ),
                         SizedBox(width: 5),
                           CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 45,
                           child: CircleAvatar(
                             radius: 43,
                             backgroundImage: AssetImage('assets/ghufran.jpg'),
                           ),
                         ),
                         SizedBox(width: 5),
                           CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 45,
                           child: CircleAvatar(
                             radius: 43,
                             backgroundImage: AssetImage('assets/karzai.jpg'),
                           ),
                         ),
                         SizedBox(width: 5),
                           CircleAvatar(
                           backgroundColor: kBlue,
                           radius: 45,
                           child: CircleAvatar(
                             radius: 43,
                             backgroundImage: AssetImage('assets/messi.jpg'),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset('assets/appIcon/company.png'),
                          title: const Text("company_name").tr(),
                          subtitle: Text(controller.companyName),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Image.asset('assets/appIcon/company.png'),
                          title: const Text("username").tr(),
                          subtitle: Text(controller.userName),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset('assets/appIcon/id.png'),
                          title: const Text("branch_id").tr(),
                          subtitle: Text(controller.branchID),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Image.asset('assets/appIcon/company.png'),
                          title: const Text("branch_name").tr(),
                          subtitle: Text(controller.branchName),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset('assets/appIcon/id.png'),
                          title: const Text("user_system_id").tr(),
                          subtitle: Text(controller.userSystemID),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.email,color: kGrey,),
                          title: const Text("email").tr(),
                          subtitle: Text(controller.email),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Image.asset('assets/appIcon/phone.png'),
                    title: const Text("phone").tr(),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                      Text("0799131313"),
                        SizedBox(width: 15),
                        Text("0788131313"),
                        SizedBox(width: 15),
                        Text("0777131313"),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('assets/appIcon/address.png'),
                    title: const Text("address").tr(),
                    subtitle: Text(controller.branchAddress),
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
