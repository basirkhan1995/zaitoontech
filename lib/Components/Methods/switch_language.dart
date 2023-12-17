import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../Colors/colors.dart';
import 'dropdown.dart';

class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({super.key});

  @override
  State<SwitchLanguage> createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 160,
            height: 40,
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(5)),
            child: DropDownButton(
              defaultSelectedIndex: 1,
              borderWidth: 20,
              items: const [
                CustomDropdownMenuItem(
                  value: "en",
                  child: Text("English"),
                ),
                CustomDropdownMenuItem(
                  value: "fa",
                  child: Text("فارسی"),
                ),
                CustomDropdownMenuItem(
                  value: "ar",
                  child: Text("پشتو"),
                ),
              ],
              hintText: Locales.currentLocale(context).toString(),
              borderRadius: 5,
              onChanged: (val) {
                setState(() {
                  Locales.change(context, val);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
