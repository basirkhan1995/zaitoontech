import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods.dart';

// Already have an Account for Text of Sign in and Sign up
class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //const SizedBox(height: 35),
          Text(
            login ? "don't_have_acc_msg".tr() : "already_acc_msg".tr(),
            style: const TextStyle(
              fontFamily: "avenir",
              color: Env.primaryLight,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: press,
            child: Text(
              login ? "signup_btn".tr() : "login_btn".tr(),
              style: const TextStyle(
                  fontFamily: "avenir",
                  color: Env.primaryLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

//Rounded Button
class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    this.text = "button",
    this.press,
    this.color = Env.primaryNormal,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double _w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: size.width * 1,
      height: 46,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(8.0)),
            elevation: MaterialStateProperty.all(40),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Env.primaryLight;
                }
                return Env.primaryLight; // Use the component's default.
              },
            ),
          ),
          onPressed: press,
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: "avenir",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ).tr(),
        ),
      ),
    );
  }
}

//Rounded Password Field
class RoundedPasswordField extends StatefulWidget {
  final String? hintText;
  final IconData icon;
  final IconData prefix;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? message;
  final TextInputType inputType;
  final int? maxLength;
  const RoundedPasswordField({
    Key? key,
    this.inputType = TextInputType.text,
    this.controller,
    this.prefix = Icons.person,
    this.hintText,
    this.message,
    this.icon = Icons.person,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}
class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    //final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: !_passwordVisible,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          } else if (value.trim().length < 8) {
            return '';
          } else {
            return null;
          }
        },
        keyboardType: widget.inputType,
        controller: widget.controller,
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Env.primaryLight),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Env.primaryLight),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding:
              const EdgeInsets.only(left: 0.0, right: 5.0, top: 5.0),
          prefixIcon: Icon(widget.icon, color: Env.primaryLight, size: 20),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              size: 20,
            ),
            color: Env.primaryLight,
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintText: widget.hintText!.tr(),
          border: InputBorder.none,
          errorStyle: const TextStyle(height: 0)
        ),
      ),
    );
  }
}

//Rounded Text Field
class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final IconData prefix;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? message;
  final TextInputType? inputType;
  final int? maxLength;
  const RoundedInputField({
    Key? key,
    this.inputType,
    this.controller,
    this.prefix = Icons.person,
    this.hintText,
    this.message,
    this.icon = Icons.person,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "";
          }
          return null;
        },
        keyboardType: inputType,
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength,
        cursorColor: Env.primaryLight,
        decoration: InputDecoration(
          counterText: '',
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding: const EdgeInsets.only(left: 0.0, right: 5.0, top: 5),
          prefixIcon: Icon(icon, color: Env.primaryLight, size: 20),
          hintText: hintText?.tr(),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.7, color: Env.primaryLight),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Env.primaryLight),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          errorStyle: const TextStyle(height: 0)
        ),
      ),
    );
  }
}

//Rounded Password Field
class RoundedComplexPasswordField extends StatefulWidget {
  final String? hintText;
  final IconData icon;
  final IconData prefix;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? message;
  final TextInputType inputType;
  const RoundedComplexPasswordField({
    Key? key,
    this.inputType = TextInputType.text,
    this.controller,
    this.prefix = Icons.person,
    this.hintText,
    this.message,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedComplexPasswordField> createState() =>
      _RoundedComplexPasswordFieldState();
}
class _RoundedComplexPasswordFieldState extends State<RoundedComplexPasswordField> {
  bool _passwordVisible = false;
  late bool _isPasswordStrong = false;

  onPassChanged(String password) {
    final passCheck =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    setState(() {
      if (passCheck.hasMatch(password)) {
        _isPasswordStrong = true;
      } else {
        _isPasswordStrong = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          TextFormField(
            obscureText: !_passwordVisible,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value) ||
                  value.length < 8) {
                return '';
              } else if (value.trim().length < 8) {
                return '';
              } else {
                return null;
              }
            },
            keyboardType: widget.inputType,
            controller: widget.controller,
            onChanged: (password) => onPassChanged(password),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 14),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.5, color: Colors.red),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.5, color: Env.primaryLight),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Env.primaryLight),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 0.0, right: 5.0, top: 5.0),
              prefixIcon: Icon(widget.icon, color: Env.primaryLight, size: 20),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                ),
                color: Env.primaryLight,
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              hintText: widget.hintText!.tr(),
              border: InputBorder.none,
              errorStyle: const TextStyle(height: 0)
            ),
          ),

          /*
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      color:
                          _isPasswordStrong ? Colors.green : Colors.transparent,
                      border: _isPasswordStrong
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                      child: Icon(Icons.check, size: 12, color: Colors.white)),
                ),
                const SizedBox(width: 10),
                const Text("complex_pass_msg").tr(),
                IconButton(
                  icon: const Icon(Icons.info, size: 20),
                  onPressed: () {
                    //Env.strongPassMessage(context);
                  },
                ),
              ],
            ),
          ),
          */

          // Row(
          //   children: [
          //     AnimatedContainer(duration:
          //     const Duration(milliseconds: 500),
          //       height: 20,
          //       width: 20,
          //       decoration: BoxDecoration(
          //           color: _isPasswordContain8Char? Colors.green: Colors.transparent,
          //           border: _isPasswordContain8Char? Border.all(color: Colors.transparent):Border.all(color: Colors.grey.shade400),
          //           borderRadius: BorderRadius.circular(50)
          //       ),
          //       child: const Center(child: Icon(Icons.check, size: 15,color: Colors.white)),
          //     ),
          //     const SizedBox(width: 10),
          //     const Text("contain_8char").tr(),
          //   ],
          // ),
          // const SizedBox(height: 10,),
          // Row(
          //   children: [
          //     AnimatedContainer(duration:
          //     const Duration(milliseconds: 500),
          //     height: 20,
          //     width: 20,
          //     decoration: BoxDecoration(
          //       color: _isPasswordContainCapital? Colors.green: Colors.transparent,
          //       border: _isPasswordContainCapital? Border.all(color: Colors.transparent):Border.all(color: Colors.grey.shade400),
          //       borderRadius: BorderRadius.circular(50)
          //     ),
          //       child: const Center(child: Icon(Icons.check, size: 15,color: Colors.white)),
          //     ),
          //     const SizedBox(width: 10),
          //     const Text("contain_upper_case").tr()
          //   ],
          // ),
          // const SizedBox(height: 10),
          // Row(
          //   children: [
          //     AnimatedContainer(duration:
          //     const Duration(milliseconds: 500),
          //       height: 20,
          //       width: 20,
          //       decoration: BoxDecoration(
          //           color: _isPasswordContainSmall? Colors.green: Colors.transparent,
          //           border: _isPasswordContainSmall? Border.all(color: Colors.transparent):Border.all(color: Colors.grey.shade400),
          //           borderRadius: BorderRadius.circular(50)
          //
          //       ),
          //       child: const Center(child: Icon(Icons.check, size: 15,color: Colors.white)),
          //     ),
          //     const SizedBox(width: 10),
          //     const Text("contain_lower_case").tr()
          //   ],
          // ),
          // const SizedBox(height: 10),
          // Row(
          //   children: [
          //     AnimatedContainer(duration:
          //     const Duration(milliseconds: 500),
          //       height: 20,
          //       width: 20,
          //       decoration: BoxDecoration(
          //           color: _isPasswordContainNum? Colors.green: Colors.transparent,
          //           border: _isPasswordContainNum? Border.all(color: Colors.transparent):Border.all(color: Colors.grey.shade400),
          //           borderRadius: BorderRadius.circular(50)
          //
          //       ),
          //       child: const Center(child: Icon(Icons.check, size: 15,color: Colors.white)),
          //     ),
          //     const SizedBox(width: 10),
          //     const Text("contain_numbers").tr()
          //   ],
          // ),
          // const SizedBox(height: 10),
          // Row(
          //   children: [
          //     AnimatedContainer(duration:
          //     const Duration(milliseconds: 500),
          //       height: 20,
          //       width: 20,
          //       decoration: BoxDecoration(
          //           color: _isPasswordContainSpecialChar? Colors.green: Colors.transparent,
          //           border: _isPasswordContainSpecialChar? Border.all(color: Colors.transparent):Border.all(color: Colors.grey.shade400),
          //           borderRadius: BorderRadius.circular(50)
          //       ),
          //       child:const Center(child: Icon(Icons.check, size: 15,color: Colors.white)),
          //     ),
          //     const SizedBox(width: 10),
          //     const Text("contain_special_char").tr()
          //   ],
          // )
        ],
      ),
    );
  }
}

//Confirm Password Field
class ConfirmPasswordField extends StatefulWidget {
  final String? hintText;
  final IconData icon;
  final IconData prefix;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? message;
  final TextInputType inputType;
  const ConfirmPasswordField({
    Key? key,
    this.inputType = TextInputType.text,
    this.controller,
    this.prefix = Icons.person,
    this.validator,
    this.hintText,
    this.message,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}
class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    //final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: !_passwordVisible,
        textInputAction: TextInputAction.next,
        validator: widget.validator,
        keyboardType: widget.inputType,
        controller: widget.controller,
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.7, color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Env.primaryLight),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Env.primaryLight),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          errorStyle: const TextStyle(height: 0),
          contentPadding:
              const EdgeInsets.only(left: 0.0, right: 5.0, top: 5.0),
          prefixIcon: Icon(widget.icon, color: Env.primaryLight, size: 20),
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                size: 20),
            color: Env.primaryLight,
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintText: widget.hintText!.tr(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

//Layout settings
class ScreenLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ScreenLayout(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Env.mobileWidth) {
          return mobile;
        } else if (constraints.maxWidth < Env.tabletWidth) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}

//Sign Up Background Image
class Background extends StatelessWidget {
  final Widget? child;
  const Background({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      //width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(5.0, 5.0))
          ],
          image: DecorationImage(
              opacity: 100,
              fit: BoxFit.cover,
              image: AssetImage('assets/photos/back2.jpg'))),
      child: child,
    );
  }
}
