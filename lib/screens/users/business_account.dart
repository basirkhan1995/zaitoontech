import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import 'package:zaitoontech/screens/users/login.dart';
import '../../components/colors/colors.dart';
import '../../components/function_methods/env.dart';
import '../../components/getX_controllers/xController.dart';
import '../../components/methods/custom_button.dart';
import '../../components/methods/input_field.dart';
import '../../services/api_services.dart';
import '../home_screen.dart';

class BusinessSignup extends StatefulWidget {
  const BusinessSignup({Key? key}) : super(key: key);

  @override
  State<BusinessSignup> createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _cellPhone = TextEditingController();
  final _userName = TextEditingController();
  final _userPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _email = TextEditingController();
  final _businessName = TextEditingController();

  final controller = Get.put(XController());
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: personalSignUpMobile(),
        tablet: personalSignUpTablet(),
        desktop: personalSignUpDesktop());
  }

  Widget personalSignUpMobile() {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ListTile(
                  minVerticalPadding: 10,
                  title: const Text(
                    "signup_btn",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: kBlue),
                  ).tr(),
                  subtitle: const Text("signup_title_msg").tr(),
                ),
                const SizedBox(height: 10),
                InputField(
                  controller: _firstName,
                  radius: 8,
                  height: 60,
                  width: .9,
                  hint: "firstname",
                  prefixIcon: Icons.person,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "firstname"),
                ),
                InputField(
                  controller: _lastName,
                  radius: 8,
                  height: 60,
                  width: .9,
                  hint: "lastname",
                  prefixIcon: Icons.people_alt,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "lastname"),
                ),
                InputField(
                  controller: _businessName,
                  radius: 8,
                  height: 60,
                  width: .9,
                  hint: "business_name",
                  prefixIcon: Icons.account_circle,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "business_name"),
                ),
                InputField(
                  controller: _email,
                  radius: 8,
                  height: 60,
                  width: .9,
                  hint: "email",
                  prefixIcon: Icons.account_circle,
                  validator: (value) =>
                      controller.emailValidator(value),
                ),
                InputField(
                  inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  keyboardInputType: TextInputType.phone,
                  controller: _cellPhone,
                  radius: 8,
                  height: 60,
                  width: .9,
                  hint: "phone",
                  prefixIcon: Icons.call,
                  validator: (value) =>
                      controller.inputFieldValidator(value, "phone"),
                ),
                
                InputField(
                  controller: _cellPhone,
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
                    validator: (value) => controller.passwordValidator(value!),
                    controller: _userPassword,
                    radius: 8,
                    width: .9,
                    height: 60,
                    hint: "password",
                    prefixIcon: Icons.lock,
                  ),
                ),
                Obx(
                      () => InputField(
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
                    validator: (value){
                      if(_userPassword.text != _confirmPassword.text){
                        return "password_not_matched";
                      }
                      return null;
                    },
                    controller: _confirmPassword,
                    radius: 8,
                    width: .9,
                    height: 60,
                    hint: "confirm_password",
                    prefixIcon: Icons.lock,
                  ),
                ),
                Button(
                  fontSize: 16,
                  radius: 8,
                  width: .9,
                  height: 60,
                  label: 'create_acc_btn',
                  backgroundColor: kBlue,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      HttpServices().personalSignUp(
                          _firstName.text,
                          _lastName.text,
                          _cellPhone.text,
                          _userName.text,
                          _userPassword.text
                      );
                    }
                  },
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("signup_already_hint").tr(),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: const Text(
                        "login_btn",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kBlue),
                      ).tr(),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen())),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personalSignUpTablet() {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *.8,
                    child: ListTile(
                      minVerticalPadding: 10,
                      title: const Text(
                        "signup_btn",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).tr(),
                      subtitle: const Text("signup_title_msg").tr(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *.8,
                      child: Row(
                          children: [
                            Expanded(
                              child: InputField(
                                controller: Env.firstName,
                                radius: 8,
                                height: 45,
                                width: .8,
                                hint: "firstname",
                                prefixIcon: Icons.person,
                                validator: (value) =>
                                    controller.inputFieldValidator(value, "firstname"),
                              ),
                            ),
                            const SizedBox(width: 3),
                            Expanded(
                              child: InputField(
                                controller: Env.lastName,
                                radius: 8,
                                height: 45,
                                width: .8,
                                hint: "lastname",
                                prefixIcon: Icons.people_alt,
                                validator: (value) =>
                                    controller.inputFieldValidator(value, "lastname"),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  InputField(
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    controller: Env.cPhone,
                    radius: 8,
                    height: 45,
                    width: .8,
                    hint: "phone",
                    prefixIcon: Icons.person,
                    validator: (value) =>
                        controller.inputFieldValidator(value, "phone"),
                  ),
                  InputField(
                    controller: Env.uName,
                    radius: 8,
                    height: 45,
                    width: .8,
                    hint: "username",
                    prefixIcon: Icons.account_circle,
                    validator: (value) =>
                        controller.inputFieldValidator(value, "username"),
                  ),
                  Obx(
                        () => InputField(
                      obscureText: !controller.isInvisible.value,
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
                      controller: controller.txtPassword,
                      radius: 8,
                      width: .8,
                      height: 45,
                      hint: "password",
                      prefixIcon: Icons.lock,
                    ),
                  ),
                  Obx(
                        () => InputField(
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
                      validator: (value){
                        if(_userPassword.text != _confirmPassword.text){
                          return "password_not_matched";
                        }
                        return null;
                      },
                      controller: controller.txtConfirmPassword,
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
                    label: 'create_acc_btn',
                    backgroundColor: kBlue,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      }
                    },
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("signup_already_hint").tr(),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: const Text(
                          "login_btn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ).tr(),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen())),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget personalSignUpDesktop() {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 5, spreadRadius: 0, offset: Offset(0, 1))
              ], color: kWhite, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height * .8,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      minVerticalPadding: 10,
                      title: const Text(
                        "signup_btn",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).tr(),
                      subtitle: const Text("signup_title_msg").tr(),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                        child: InputField(
                          controller: _firstName,
                          radius: 8,
                          height: 45,
                          width: .8,
                          hint: "firstname",
                          prefixIcon: Icons.person,
                          validator: (value) => controller.inputFieldValidator(
                              value, "firstname"),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: InputField(
                          controller: _lastName,
                          radius: 8,
                          height: 45,
                          width: .8,
                          hint: "lastname",
                          prefixIcon: Icons.people_alt,
                          validator: (value) =>
                              controller.inputFieldValidator(value, "lastname"),
                        ),
                      ),
                    ]),
                    InputField(
                      inputFormat: [FilteringTextInputFormatter.digitsOnly],
                      controller: _cellPhone,
                      radius: 8,
                      height: 45,
                      width: .9,
                      hint: "phone",
                      prefixIcon: Icons.person,
                      validator: (value) => controller.inputFieldValidator(value, "phone"),
                    ),
                    InputField(
                      controller: _userName,
                      radius: 8,
                      height: 45,
                      width: .8,
                      hint: "username",
                      prefixIcon: Icons.account_circle,
                      validator: (value) => controller.inputFieldValidator(value, "username"),
                    ),
                    Obx(() => InputField(
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
                      hint: "password",
                      prefixIcon: Icons.lock,
                    )),
                    Obx(() => InputField(
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
                      validator: (value){
                        if(_userPassword.text != _confirmPassword.text){
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
                    )),
                    Button(
                      radius: 8,
                      width: .8,
                      height: 40,
                      label: 'create_acc_btn',
                      backgroundColor: kBlue,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          HttpServices().personalSignUp(
                              _firstName.text,
                              _lastName.text,
                              _cellPhone.text,
                              _userName.text,
                              _userPassword.text
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("signup_already_hint").tr(),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: const Text(
                            "login_btn",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ).tr(),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen())),
                        )
                      ],
                    ),
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
