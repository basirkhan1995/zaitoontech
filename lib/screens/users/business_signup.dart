// ignore_for_file: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../components/components.dart';
import '../../components/function_methods/env.dart';
import '../../services/api_services.dart';
import 'login.dart';

class BusinessSignup extends StatefulWidget {
  final String companyType;
  const BusinessSignup({Key? key, required this.companyType}) : super(key: key);

  @override
  State<BusinessSignup> createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayout(
        mobile: _mobileSignup(),
        tablet: _tabletSignup(),
        desktop: _desktopSignup(),
      ),
    );
  }

  //Mobile Sign Up
  Widget _mobileSignup(){
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Create Account title
              const Text(
                'create_acc_title',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ).tr(),
              const Text(
                'create_acc_subtitle',
                style: TextStyle(fontSize: 13, color: Colors.green),
              ).tr(),
              const SizedBox(height: 10),
              // First Name Field
              RoundedInputField(
                controller: _firstName,
                hintText: 'first_name',
                icon: Icons.person,
                message: 'first_name_error_msg',
                onChanged: (value) {},
              ),
              //Lastname Field
              RoundedInputField(
                controller: _lastName,
                hintText:'last_name',
                icon: Icons.people,
                message: 'username_error_msg',
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: _companyName,
                hintText: 'company_name',
                message:'company_error_msg',
                icon: Icons.business,
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: _phone,
                hintText: 'phone',
                message:'phone_error_msg',
                icon: Icons.phone,
                onChanged: (value) {},
              ),
              //username field
              RoundedInputField(
                controller: _userName,
                hintText:'username',
                message: 'username_error_msg',
                icon: Icons.email,
                onChanged: (value) {},
              ),
              //Password field
              RoundedComplexPasswordField(
                controller: _password,
                hintText: 'password',
                icon: Icons.lock,
                message: 'password_error_msg',
                onChanged: (value) {},
              ),
              //confirmPassword(),
              ConfirmPasswordField(
                controller: _confirmPass,
                icon: Icons.lock,
                onChanged: (value) {},
                hintText: "confirm_password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "";
                  } else if (_password.text != _confirmPass.text) {
                    return "";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              RoundedButton(
                press: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() => inProcess = true);
                    businessSignup().then((value) => setState(() => inProcess = false));
                  }
                },
                text: 'signup_btn',
              ),
              //If you don't have an account; will Navigate you to Login Account
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Env.jumpScreen(context, const LoginScreen());
                },
              ),
              const SizedBox(height: 6),
              SizedBox(height: 60, child: inProcess? const SpinKitCircle(color: Colors.green): const Text("")),
            ],
          ),
        ),
      ),
    );
  }
  //Tablet Sign Up
  Widget _tabletSignup(){
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            constraints: const BoxConstraints(
                maxWidth: 500
            ),
            //padding: const EdgeInsets.symmetric(vertical: 20,horizontal:90),
            child: Column(
              children: [
                //Create Account title
                const Text(
                  'create_acc_title',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,fontFamily: "avenir"),
                ).tr(),
                Text(
                  'create_acc_subtitle',
                  style: TextStyle(fontSize: 15,fontFamily: "avenir" ,color: Colors.green.withOpacity(.7)),
                ).tr(),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: RoundedInputField(
                        controller: _firstName,
                        hintText: 'first_name',
                        icon: Icons.person,
                        message: 'first_name_error_msg',
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RoundedInputField(
                        controller: _lastName,
                        hintText: 'last_name',
                        icon: Icons.people,
                        message: 'last_name_error_msg',
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                RoundedInputField(
                  controller: _companyName,
                  hintText: 'company_name',
                  message:'username_error_msg',
                  icon: Icons.business,
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  controller: _phone,
                  hintText: 'phone',
                  message:'phone_error_msg',
                  icon: Icons.phone,
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  controller: _userName,
                  hintText: 'username',
                  message: 'username_error_msg',
                  maxLength: 50,
                  icon: Icons.email,
                  onChanged: (value) {},
                ),
                RoundedComplexPasswordField(
                  controller: _password,
                  hintText: 'password',
                  icon: Icons.lock,
                  message: 'password_error_msg',
                  onChanged: (value) {},
                ),
                ConfirmPasswordField(
                  controller: _confirmPass,
                  icon: Icons.lock,
                  onChanged: (value) {},
                  hintText: "confirm_password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "confirm_pass_error_msg".tr();
                    } else if (_password.text != _confirmPass.text) {
                      return "no_match_pass_msg".tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                RoundedButton(
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() => inProcess = true);
                      businessSignup().then((value) => setState(() => inProcess = false));
                    }
                  },
                  text: 'signup_btn',
                ),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Env.jumpScreen(context, const LoginScreen());
                  },
                ),
                SizedBox(
                  height: 60,
                  child: inProcess
                      ? const SpinKitCircle(
                    color: Colors.green,
                    size: 40,
                  )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //desktop Sign up
  Widget _desktopSignup() {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: 600,
            height: size.height * 0.95,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:30.0,horizontal: 60),
                    child: Column(
                      children: [
                        //Create Account title
                        ListTile(
                          title: const Text(
                            'create_acc_title',
                            style: TextStyle(
                                fontFamily: "avenir",
                                fontSize: 25,
                                color: Colors.green,
                                fontWeight: FontWeight.w600),
                          ).tr(),
                          subtitle:  Text(
                            'create_acc_subtitle',
                            style: TextStyle(
                                fontFamily: "avenir",
                                fontSize: 15, color: Colors.green.withOpacity(.7)),
                          ).tr(),
                        ),

                        //Create Title

                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: RoundedInputField(
                                controller: _firstName,
                                hintText: 'first_name',
                                icon: Icons.person,
                                message: 'first_name_error_msg',
                                maxLength: 30,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: RoundedInputField(
                                maxLength: 20,
                                controller: _lastName,
                                hintText: 'last_name',
                                icon: Icons.people,
                                message: 'last_name_error_msg',
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        RoundedInputField(
                          controller: _companyName,
                          hintText: 'company_name',
                          message:'username_error_msg',
                          icon: Icons.business,
                          onChanged: (value) {},
                        ),
                        RoundedInputField(
                          controller: _phone,
                          hintText: 'phone',
                          message:'phone_error_msg',
                          icon: Icons.phone,
                          onChanged: (value) {},
                        ),
                        RoundedInputField(
                          controller: _userName,
                          hintText: 'username',
                          message:'username_error_msg',
                          icon: Icons.email,
                          onChanged: (value) {},
                        ),
                        RoundedComplexPasswordField(
                          controller: _password,
                          hintText: 'password',
                          icon: Icons.lock,
                          message: 'password_error_msg',
                        ),
                        ConfirmPasswordField(
                          controller: _confirmPass,
                          icon: Icons.lock,
                          onChanged: (value) {},
                          hintText: "confirm_password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "";
                            } else if (_password.text != _confirmPass.text) {
                              return "";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        RoundedButton(
                          press: () {
                            if (_formKey.currentState!.validate()){
                              setState(() => inProcess = true);
                              businessSignup().then((value) => setState(() => inProcess = false));
                            }
                          },
                          text: 'signup_btn',
                        ),
                        const SizedBox(height: 10),
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
                        SizedBox(
                          height: 60,
                          child: inProcess
                              ? const SpinKitCircle(
                            color: Colors.green,
                            size: 40,
                          )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> businessSignup() async {
    HttpServices hs = HttpServices();
    var dataBody = {
      "firstName": _firstName.text,
      "lastName": _lastName.text,
      "companyName": _companyName.text,
      "companyPhone": _phone.text,
      "companyType": widget.companyType,
      "userName": _userName.text,
      "userPass": _password.text
    };
    // var result = await hs.httpPost("signupBusiness.php", dataBody, context);
    // String msg = result['msg'];
    // if (msg == "Exists") {
    //   Env.zDialog("acc_exist_title", "acc_exist_msg", context);
    // } else if (msg == "Failed") {
    //   Env.zDialog("failed_acc_create_title", "failed_acc_create_msg", context);
    // } else {
    //   Env.jumpScreen(context, const LoginScreen());
    // }
  }

}
