import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../colors/colors.dart';


class PasswordInputField extends StatefulWidget {
  final String? hint;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? height;
  final double? width;
  final double? radius;
  final FormFieldValidator<String>? validator;
  final TextInputAction? inputAction;
  final ValueChanged<String>?onChanged;
  final TextInputType? keyboardInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormat;
  const PasswordInputField(
      {Key? key,
        this.hint,
        this.label,
        this.prefixIcon,
        this.suffixIcon,
        this.inputAction,
        this.height = 70,
        this.width = .4,
        this.radius = 10,
        this.controller,
        this.validator,
        this.onChanged,
        this.inputFormat,
        this.keyboardInputType
      })
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool notValidated = false;
  bool isPasswordVisible = false;
  final firstPass = TextEditingController();
  final secondPass = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(XController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      //padding: const EdgeInsets.only(top: 0,bottom: 0),
      height: widget.height!,
      width: MediaQuery.of(context).size.width * widget.width!,
      child: TextFormField(
        obscureText: !isPasswordVisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: widget.inputFormat,
        onChanged: (value)=> widget.validator,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius!),
                borderSide: const BorderSide(color: kBlue,width: 1.5)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius!),
                borderSide: const BorderSide(color: kBlue,width: 2)            ),
            focusedErrorBorder: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(color: Colors.red.shade900,width: 2),
            ),
            errorBorder: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(color: Colors.red.shade900,width: 1.5),
            ),
            enabled: true,
            //labelText: widget.hint,
            hintText: widget.hint!.tr,
            prefixIcon: const Icon(Icons.lock,color: kBlue,size: 20,),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                size: 20,
              ),
              color: kBlue,
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            hoverColor: Colors.amber),
      ),
    );
  }
}
