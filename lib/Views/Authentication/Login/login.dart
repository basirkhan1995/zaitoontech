import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:zaitoontech/Components/Methods/button.dart';
import 'package:zaitoontech/Components/Methods/responsive.dart';
import 'package:zaitoontech/Components/Methods/textfield.dart';
import 'package:zaitoontech/Views/Authentication/background.dart';

import '../../../Components/Methods/switch_language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool isVisible = false;
  bool isLoginTrue = false;
  bool rememberMe = false;

  final formKey = GlobalKey <FormState>();

  List languages = [
    "en",
    "fa",
    "ar"
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            SwitchLanguage(),
          ],
        ),
        body: ScreenLayout(
      mobile: mobile(),
      tablet: tablet(),
      desktop: desktop(),
    ));
  }

  Widget mobile() {
    return Center(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              children: [

                const ListTile(
                  title: LocaleText(
                    "zaitoon",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  subtitle: LocaleText("login"),
                ),
                //Body
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ZField(
                            title: "username",
                            icon: Icons.account_circle_rounded,
                            controller: username,
                            validator: (value){
                              if(value.isEmpty){
                                return Locales.string(context, "username_required");
                              }
                              return null;
                            },
                          ),

                          ZField(
                            securePassword: isVisible,
                            title: "password",
                            icon: Icons.lock,
                            controller: password,
                            validator: (value){
                              if(value.isEmpty){
                                return Locales.string(context, "password_required");
                              }
                              return null;
                            },
                            trailing: IconButton(
                              onPressed: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                            ),
                          ),

                          ListTile(
                            horizontalTitleGap: 12,
                            contentPadding: const EdgeInsets.only(left: 0),
                            title: const LocaleText("remember_me"),
                            leading: Checkbox(
                              value: rememberMe,
                              onChanged: (value){
                                setState(() {
                                  rememberMe = !rememberMe;
                                });
                              },
                            ),
                          ),

                          ZButton(
                              label: "login",
                              fontSize: 15,
                              onTap: () {
                                if(formKey.currentState!.validate()){

                                }
                              }
                          ),

                          //End
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const LocaleText("signup_message"),
                              TextButton(
                                  onPressed: (){},
                                  child: const LocaleText("register",style: TextStyle(fontWeight: FontWeight.bold),))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //End
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: LocaleText("access_denied",style: TextStyle(color: Colors.red.shade900),),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tablet() {
    return Center(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              children: [

                const ListTile(
                  title: LocaleText(
                    "zaitoon",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  subtitle: LocaleText("login"),
                ),
                //Body
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ZField(
                            title: "username",
                            icon: Icons.account_circle_rounded,
                            controller: username,
                            validator: (value){
                              if(value.isEmpty){
                                return Locales.string(context, "username_required");
                              }
                              return null;
                            },
                          ),

                          ZField(
                            securePassword: isVisible,
                            title: "password",
                            icon: Icons.lock,
                            controller: password,
                            validator: (value){
                              if(value.isEmpty){
                                return Locales.string(context, "password_required");
                              }
                              return null;
                            },
                            trailing: IconButton(
                              onPressed: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                            ),
                          ),

                          ListTile(
                            horizontalTitleGap: 12,
                            contentPadding: const EdgeInsets.only(left: 8),
                            title: const LocaleText("remember_me"),
                            leading: Checkbox(
                              value: rememberMe,
                              onChanged: (value){
                                setState(() {
                                  rememberMe = !rememberMe;
                                });
                              },
                            ),
                          ),

                          ZButton(
                              label: "login",
                              fontSize: 15,
                              onTap: () {
                                if(formKey.currentState!.validate()){

                                }
                              }
                          ),

                          //End
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const LocaleText("signup_message"),
                              TextButton(
                                  onPressed: (){},
                                  child: const LocaleText("register",style: TextStyle(fontWeight: FontWeight.bold),))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //End
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: LocaleText("access_denied",style: TextStyle(color: Colors.red.shade900),),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget desktop() {
    return Background(
        image: "login.gif",
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Column(
                children: [

                 const ListTile(
                    title: LocaleText(
                      "zaitoon",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    subtitle: LocaleText("login"),
                  ),
                 //Body
                 Expanded(
                   child: Center(
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                           ZField(
                               title: "username",
                               icon: Icons.account_circle_rounded,
                               controller: username,
                               validator: (value){
                               if(value.isEmpty){
                                 return Locales.string(context, "username_required");
                               }
                               return null;
                             },
                           ),

                           ZField(
                             securePassword: isVisible,
                             title: "password",
                             icon: Icons.lock,
                             controller: password,
                             validator: (value){
                               if(value.isEmpty){
                                 return Locales.string(context, "password_required");
                               }
                               return null;
                             },
                             trailing: IconButton(
                               onPressed: (){
                                 setState(() {
                                   isVisible = !isVisible;
                                 });
                               },
                               icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                             ),
                           ),

                           ListTile(
                             horizontalTitleGap: 6,
                             contentPadding: const EdgeInsets.only(left: 0),
                             title: const LocaleText("remember_me"),
                             leading: Checkbox(
                               value: rememberMe,
                               onChanged: (value){
                                 setState(() {
                                   rememberMe = !rememberMe;
                                 });
                               },
                             ),
                           ),

                           ZButton(
                               label: "login",
                               fontSize: 15,
                               onTap: () {
                                 if(formKey.currentState!.validate()){

                                 }
                               }
                           ),

                           //End
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               const LocaleText("signup_message"),
                               TextButton(
                                   onPressed: (){},
                                   child: const LocaleText("register",style: TextStyle(fontWeight: FontWeight.bold),))
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),

                 //End
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: LocaleText("access_denied",style: TextStyle(color: Colors.red.shade900),),
                ),




                ],
              ),
            ),
          ),
        ));

  }
}
