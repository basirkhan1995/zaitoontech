import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/input_field.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import 'package:zaitoontech/screens/home_screen.dart';
import 'package:zaitoontech/screens/users/signup.dart';
import '../../components/function_methods/env.dart';
import '../../components/methods/custom_button.dart';
import '../../services/api_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(XController());

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: loginMobile(context),
        tablet: loginTablet(),
        desktop: loginDesktop(context));
  }

  Widget loginMobile(context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "login_title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).tr(),
                const SizedBox(height: 60),
                SizedBox(
                  child: Image.asset(
                    'assets/login.png',
                    width: 250,
                  ),
                ),
                const SizedBox(height: 10),
                InputField(
                  controller: Env.uName,
                  radius: 8,
                  height: 60,
                  width: .9,
                  hint: "username",
                  prefixIcon: Icons.account_circle,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "username"),
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
                        controller.inputFieldValidator(value!, "password"),
                    controller: Env.uPassword,
                    radius: 8,
                    width: .9,
                    height: 60,
                    hint: "password",
                    prefixIcon: Icons.lock,
                  ),
                ),
                Button(
                  fontSize: 16,
                  radius: 8,
                  width: .9,
                  height: 50,
                  label: 'login_btn',
                  backgroundColor: kBlue,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      HttpServices().login(context);
                    }
                  },
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("login_no_account_hint").tr(),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: const Text(
                        "create_acc_btn",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kBlue),
                      ).tr(),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PersonalSignUpScreen())),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                const Text("forgot_password_btn",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kBlue))
                    .tr()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginTablet() {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text(
                      "login_title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).tr(),
                  ),
                  SizedBox(
                    width: 350,
                    child: Image.asset('assets/login.png'),
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: Env.uName,
                    radius: 8,
                    height: 60,
                    width: .8,
                    hint: "username",
                    prefixIcon: Icons.account_circle,
                    validator: (value) =>
                        controller.inputFieldValidator(value, "username"),
                  ),
                  Obx(() => InputField(
                    validator: (value) => controller.inputFieldValidator(value!, "password"),
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
                    controller: Env.uPassword,
                    radius: 8,
                    width: .8,
                    height: 60,
                    hint: "password",
                    prefixIcon: Icons.lock,
                  )),
                  Button(
                    radius: 8,
                    width: .8,
                    height: 40,
                    label: 'login_btn',
                    backgroundColor: kBlue,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        HttpServices().login(context);
                      }
                    },
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("login_no_account_hint").tr(),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: const Text(
                          "create_acc_btn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ).tr(),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PersonalSignUpScreen())),
                      )
                    ],
                  ),
                  const Text("forgot_password_btn",
                          style: TextStyle(fontWeight: FontWeight.bold))
                      .tr()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginDesktop(context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 5, spreadRadius: 0, offset: Offset(0, 1))
              ], color: kWhite, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height * .7,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20, top: 10, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 120,
                          height: 120,
                          child: Image.asset('assets/zaitoonLogo.jpg')),
                      ListTile(
                        title: const Text(
                          "login_title",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ).tr(),
                        subtitle: const Text("Enter your credential details to access Zaitoon"),
                      ),
                      const SizedBox(height: 5),
                      InputField(
                        controller: Env.uName,
                        radius: 8,
                        height: 60,
                        width: .9,
                        hint: "username",
                        prefixIcon: Icons.account_circle,
                        validator: (value) =>
                            controller.inputFieldValidator(value, "username"),
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
                              controller.inputFieldValidator(value!, "password"),
                          controller: Env.uPassword,
                          radius: 8,
                          width: .9,
                          height: 60,
                          hint: "password",
                          prefixIcon: Icons.lock,
                        ),
                      ),

                      Button(
                        radius: 8,
                        width: .9,
                        height: 40,
                        label: 'login_btn',
                        backgroundColor: kBlue,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            //HttpServices().login(context);
                            Get.to(const HomeScreen());
                          }
                        },
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("login_no_account_hint").tr(),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: const Text(
                              "create_acc_btn",
                              style: TextStyle(fontWeight: FontWeight.bold,color: kBlue),
                            ).tr(),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PersonalSignUpScreen())),
                          )
                        ],
                      ),
                      const Text("forgot_password_btn",
                          style: TextStyle(fontWeight: FontWeight.bold,color: kBlue))
                          .tr()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
