import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/methods/input_field.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/colors/colors.dart';
import '../../components/getX_controllers/xController.dart';
import '../../components/methods/app_header.dart';
import '../../components/methods/custom_button.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _userCurrentPassword = TextEditingController();
  final _userPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final controller = Get.put(XController());
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: changePassMobile(), tablet: changePassTablet(), desktop: changePassDesktop());
  }

  Widget changePassMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("change_password"),
        ),
        body: const Text("change password Mobile"));
  }

  Widget changePassTablet(){
    return  Scaffold(
        appBar: AppBar(
          title: const Text("change_password"),
        ),
        body: Form(
          key: formKey,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            margin: const EdgeInsets.all(10.0),
            child: ListView(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 15),
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBlue.withOpacity(.05),
                    ),
                    child: const Icon(Icons.lock,size: 120,color: kGrey,),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                      () => InputField(
                    obscureText: controller.isInvisible.value,
                    suffixIcon: IconButton(
                      icon: !controller.isInvisible.value
                          ? const Icon(Icons.visibility, color: kBlue)
                          : const Icon(Icons.visibility_off,
                          color: kBlue),
                      onPressed: () {
                        controller.isInvisible.value =
                        !controller.isInvisible.value;
                      },
                    ),
                    validator: (value) =>
                        controller.inputFieldValidator(value!,'current_password'),
                    controller: _userCurrentPassword,
                    radius: 8,
                    width: .8,
                    height: 45,
                    hint: "current password",
                    prefixIcon: Icons.lock,
                  ),
                ),
                Obx(
                      () => InputField(
                    obscureText: controller.isInvisible.value,
                    suffixIcon: IconButton(
                      icon: !controller.isInvisible.value
                          ? const Icon(Icons.visibility, color: kBlue)
                          : const Icon(Icons.visibility_off,
                          color: kBlue),
                      onPressed: () {
                        controller.isInvisible.value =
                        !controller.isInvisible.value;
                      },
                    ),
                    validator: (value) =>
                        controller.passwordValidator(value!),
                    controller: _userPassword,
                    radius: 8,
                    width: .8,
                    height: 45,
                    hint: "new_password",
                    prefixIcon: Icons.lock,
                  ),
                ),
                Obx(
                      () => InputField(
                    obscureText: controller.isInvisible.value,
                    suffixIcon: IconButton(
                      icon: !controller.isInvisible.value
                          ? const Icon(Icons.visibility, color: kBlue)
                          : const Icon(Icons.visibility_off,
                          color: kBlue),
                      onPressed: () {
                        controller.isInvisible.value =
                        !controller.isInvisible.value;
                      },
                    ),

                    validator: (value){
                      if(value == null){
                        return "confirm password is required";
                      }
                      else if(_userPassword.text != _confirmPassword.text){
                        return "password_not_matched";
                      }
                      return null;
                    },
                    controller: _confirmPassword,
                    radius: 8,
                    width: .8,
                    height: 45,
                    hint: "confirm_password",
                    prefixIcon: Icons.lock,
                  ),
                ),
                Button(
                  radius: 8,
                  width: .8,
                  height: 45,
                  label: 'update_password',
                  backgroundColor: kBlue,
                  onTap: () {
                    if (formKey.currentState!.validate()) {

                    }
                    else{
                      print("Values all Empty");
                    }
                  },
                ),

              ],
            ),
          ),
        ));
  }

  Widget changePassDesktop(){
    return Scaffold(
        body: Column(
      children: const [
        AppHeader(title: "change_password",leadingIcon: Icons.arrow_back_ios_new_outlined, routeIndex: 5),
        Text("change password Desktop"),
      ],
    ));
  }
}
