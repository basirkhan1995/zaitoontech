import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/colors.dart';

class InputField extends StatefulWidget {
  final String? hint;
  final String? label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final double? width;
  final double? radius;
  final int? maxLength;
  final FormFieldSetter? onSubmit;
  final bool? obscureText;
  final TextInputAction? inputAction;
  final ValueChanged<String>?onChanged;
  final FormFieldValidator? validator;
  final TextInputType? keyboardInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormat;
  const InputField(
      {Key? key,
        this.onSubmit,
        this.hint,
        this.label,
        this.maxLength,
        this.obscureText = false,
        this.prefixIcon,
        this.suffixIcon,
        this.inputAction,
        this.validator,
        this.height = 70,
        this.width = .4,
        this.radius = 10,
        this.controller,
        this.onChanged,
        this.inputFormat,
        this.keyboardInputType
      })
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isValidated = false;

  @override
  void initState() {
    super.initState(
    );
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(XController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      //padding: const EdgeInsets.only(top: 0,bottom: 0),
      width: MediaQuery.of(context).size.width * widget.width!,
      height: widget.height,
      child: TextFormField(
        onFieldSubmitted: widget.onSubmit,
        obscureText: widget.obscureText!,
        maxLength: widget.maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardInputType,
        inputFormatters: widget.inputFormat,
        onChanged: widget.onChanged,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
            counterText: '',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius!),
                borderSide:  BorderSide(color: Colors.grey.shade900,width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius!),
                borderSide: const BorderSide(color: kBlue,width: 1.5)),
            focusedErrorBorder: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(color: Colors.red.shade900,width: 1.5),
            ),
            errorBorder: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(color: Colors.red.shade900),
            ),
            enabled: true,
            //labelText: widget.hint,
            hintText: widget.hint!.tr(),
            prefixIcon: Icon(widget.prefixIcon,color: kBlue,size: 20,),
            suffixIcon: widget.suffixIcon,
            hoverColor: Colors.amber),
      ),
    );
  }
}
