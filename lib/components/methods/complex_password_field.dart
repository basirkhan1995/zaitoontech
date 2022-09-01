import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../colors/colors.dart';
import '../getX_controllers/xController.dart';

class ComplexPasswordField extends StatefulWidget {
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
  const ComplexPasswordField(
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
  State<ComplexPasswordField> createState() => _ComplexPasswordFieldState();
}

class _ComplexPasswordFieldState extends State<ComplexPasswordField> {
  bool isPasswordStrong = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(XController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.only(top: 0,bottom: 0),
      height: widget.height!,
      width: MediaQuery.of(context).size.width * widget.width!,
      child: TextFormField(
        obscureText: !isPasswordVisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: widget.inputFormat,
        //onChanged: (value) => widget.validator,
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
              borderSide: BorderSide(color: Colors.red.shade900),
            ),
            enabled: true,
            //labelText: widget.hint,
            hintText: widget.hint!.tr,
            prefixIcon: const Icon(Icons.lock,color: kBlue,size: 20,),
            suffixIcon: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(()=>controller.passwordVerifier()),
                  //Obx(() => controller.isPasswordStrong.value? const Icon(Icons.check_circle,color: Colors.green,size: 20):const SizedBox()),
                  const SizedBox(width: 2),
                  IconButton(
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

                ],
              ),
            ),
            hoverColor: Colors.amber),
      ),
    );
  }
}
