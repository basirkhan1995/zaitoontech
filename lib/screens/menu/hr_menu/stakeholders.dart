import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import 'package:zaitoontech/screens/menu/hr_menu/users.dart';
import 'package:zaitoontech/services/jsonModel/usersModel.dart';
import 'package:zaitoontech/services/localDB/local_db.dart';
import '../../../components/methods/input_field.dart';


class MyUsers extends StatefulWidget {
  const MyUsers({Key? key}) : super(key: key);

  @override
  State<MyUsers> createState() => _MyUsersState();
}

class _MyUsersState extends State<MyUsers> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final cellPhone = TextEditingController();
  final userName = TextEditingController();
  final userPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final controller = Get.put(XController());
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: mobileMyUser(), tablet: tabletMyUser(), desktop: desktopMyUser());
  }
  Widget desktopMyUser(){
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      minVerticalPadding: 5,
                      title: const Text(
                        "personal_info",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).tr(),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                        child: InputField(
                          inputAction: TextInputAction.next,
                          controller: firstName,
                          radius: 8,
                          height: 45,
                          width: .9,
                          hint: "firstname",
                          prefixIcon: Icons.person,
                          validator: (value) => controller
                              .inputFieldValidator(value, "firstname"),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: InputField(
                          inputAction: TextInputAction.next,
                          controller: lastName,
                          radius: 8,
                          height: 45,
                          width: .9,
                          hint: "lastname",
                          prefixIcon: Icons.people_alt,
                          validator: (value) => controller
                              .inputFieldValidator(value, "lastname"),
                        ),
                      ),
                    ]),
                    InputField(
                      keyboardInputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      inputFormat: [FilteringTextInputFormatter.digitsOnly],
                      controller: cellPhone,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "phone",
                      prefixIcon: Icons.call,
                      validator: (value) =>
                          controller.inputFieldValidator(value, "phone"),
                    ),
                    InputField(
                      inputAction: TextInputAction.next,
                      controller: email,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "email",
                      prefixIcon: Icons.email,
                      validator: (value) =>
                          controller.emailValidator(value),
                    ),
                    InputField(
                      inputAction: TextInputAction.next,
                      controller: userName,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "username",
                      prefixIcon: Icons.account_circle,
                      validator: (value) =>
                          controller.inputFieldValidator(value, "username"),
                    ),
                    Obx(() => InputField(
                      inputAction: TextInputAction.next,
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
                      controller: userPassword,
                      radius: 8,
                      width: .9,
                      height: 45,
                      hint: "password",
                      prefixIcon: Icons.lock,
                    )),
                    Obx(() => InputField(
                      inputAction: TextInputAction.done,
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
                      obscureText: controller.isInvisible.value,
                      validator: (value) {
                        if (userPassword.text !=
                            confirmPassword.text) {
                          return "password_not_matched";
                        }
                        return null;
                      },
                      controller: confirmPassword,
                      radius: 8,
                      width: .9,
                      height: 45,
                      hint: "confirm_password",
                      prefixIcon: Icons.lock,
                    )),

                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: kBlue,
                      ),
                      child: TextButton(
                          onPressed: ()async{
                            if(formKey.currentState!.validate()){
                              await DBHelper.createUser(UserModel(
                                  usrName: userName.text,
                                  usrPass: userPassword.text,
                                  usrEmail: email.text,
                                  usrFirstName: firstName.text,
                                  usrLastName: lastName.text,
                                  usrPhone: cellPhone.text));
                            }
                          }, child: const Text("Submit")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget tabletMyUser(){
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      minVerticalPadding: 5,
                      title: const Text(
                        "personal_info",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).tr(),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                        child: InputField(
                          inputAction: TextInputAction.next,
                          controller: firstName,
                          radius: 8,
                          height: 45,
                          width: .9,
                          hint: "firstname",
                          prefixIcon: Icons.person,
                          validator: (value) => controller
                              .inputFieldValidator(value, "firstname"),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: InputField(
                          inputAction: TextInputAction.next,
                          controller: lastName,
                          radius: 8,
                          height: 45,
                          width: .9,
                          hint: "lastname",
                          prefixIcon: Icons.people_alt,
                          validator: (value) => controller
                              .inputFieldValidator(value, "lastname"),
                        ),
                      ),
                    ]),
                    InputField(
                      inputAction: TextInputAction.next,
                      inputFormat: [FilteringTextInputFormatter.digitsOnly],
                      controller: cellPhone,
                      keyboardInputType: TextInputType.number,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "phone",
                      prefixIcon: Icons.call,
                      validator: (value) =>
                          controller.inputFieldValidator(value, "phone"),
                    ),
                    InputField(
                      inputAction: TextInputAction.next,
                      controller: email,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "email",
                      prefixIcon: Icons.email,
                      validator: (value) =>
                          controller.emailValidator(value),
                    ),
                    InputField(
                      inputAction: TextInputAction.next,
                      controller: userName,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "username",
                      prefixIcon: Icons.account_circle,
                      validator: (value) =>
                          controller.inputFieldValidator(value, "username"),
                    ),
                    Obx(() => InputField(
                      inputAction: TextInputAction.next,
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
                      controller: userPassword,
                      radius: 8,
                      width: .9,
                      height: 45,
                      hint: "password",
                      prefixIcon: Icons.lock,
                    )),
                    Obx(() => InputField(
                      inputAction: TextInputAction.done,
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
                      obscureText: controller.isInvisible.value,
                      validator: (value) {
                        if (userPassword.text !=
                            confirmPassword.text) {
                          return "password_not_matched";
                        }
                        return null;
                      },
                      controller: confirmPassword,
                      radius: 8,
                      width: .9,
                      height: 45,
                      hint: "confirm_password",
                      prefixIcon: Icons.lock,
                    )),

                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: TextButton(
                          onPressed: ()async{
                            if(formKey.currentState!.validate()){
                              await DBHelper.createUser(UserModel(
                                  usrName: userName.text,
                                  usrPass: userPassword.text,
                                  usrEmail: email.text,
                                  usrFirstName: firstName.text,
                                  usrLastName: lastName.text,
                                  usrPhone: cellPhone.text));
                            }
                          }, child: const Text("Submit")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget mobileMyUser(){
    return Scaffold(
      appBar: AppBar(
        title: const Text("add user"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    "personal_info",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ).tr(),
                ),

                InputField(
                  inputAction: TextInputAction.next,
                  controller: firstName,
                  radius: 8,
                  height: 45,
                  width: .9,
                  hint: "firstname",
                  prefixIcon: Icons.person,
                  validator: (value) => controller
                      .inputFieldValidator(value, "firstname"),
                ),
                const SizedBox(width: 3),
                InputField(
                  inputAction: TextInputAction.next,
                  controller: lastName,
                  radius: 8,
                  height: 45,
                  width: .9,
                  hint: "lastname",
                  prefixIcon: Icons.people_alt,
                  validator: (value) => controller
                      .inputFieldValidator(value, "lastname"),
                ),
                InputField(
                  keyboardInputType: TextInputType.phone,
                  inputAction: TextInputAction.next,
                  inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  controller: cellPhone,
                  radius: 8,
                  height: 45,
                  width: .9,
                  hint: "phone",
                  prefixIcon: Icons.call,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "phone"),
                ),
                InputField(
                  inputAction: TextInputAction.next,
                  controller: email,
                  radius: 8,
                  height: 45,
                  width: .9,
                  hint: "email",
                  prefixIcon: Icons.email,
                  validator: (value) =>
                      controller.emailValidator(value),
                ),
                InputField(
                  inputAction: TextInputAction.next,
                  controller: userName,
                  radius: 8,
                  height: 45,
                  width: .9,
                  hint: "username",
                  prefixIcon: Icons.account_circle,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "username"),
                ),
                Obx(() => InputField(
                  inputAction: TextInputAction.next,
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
                  controller: userPassword,
                  radius: 8,
                  width: .9,
                  height: 45,
                  hint: "password",
                  prefixIcon: Icons.lock,
                )),
                Obx(() => InputField(
                  inputAction: TextInputAction.done,
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
                  obscureText: controller.isInvisible.value,
                  validator: (value) {
                    if (userPassword.text !=
                        confirmPassword.text) {
                      return "password_not_matched";
                    }
                    return null;
                  },
                  controller: confirmPassword,
                  radius: 8,
                  width: .9,
                  height: 45,
                  hint: "confirm_password",
                  prefixIcon: Icons.lock,
                )),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width *.9,
                  decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: TextButton(

                      onPressed: ()async{
                        if(formKey.currentState!.validate()){
                          await DBHelper.createUser(
                              UserModel(
                              usrName: userName.text,
                              usrPass: userPassword.text,
                              usrEmail: email.text,
                              usrFirstName: firstName.text,
                              usrLastName: lastName.text,
                              usrPhone: cellPhone.text)).whenComplete(() => Get.to(const Users())).then((value) => debugPrint('Success insert'));
                        }
                      }, child: const Text("Submit")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
