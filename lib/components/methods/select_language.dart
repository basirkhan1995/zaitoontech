import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {

  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: IconButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (ctx) =>SimpleDialog(
              title: const Text("select_language").tr(),
              children: [
                languageTile("English", "en", "US", 0, 0),
                languageTile("فارسی", "fa", "AF", 1, 1),
                languageTile("پشتو", "ar", "SA", 2, 2),
              ],
            ), );
        },
        icon: const Icon(Icons.language),
      )


    );
  }
  Widget languageTile(String languageTitle, String languageName, String languageCode,int index, int selectedID){
    bool isSelected = selectedIndex == index;
    return ListTile(
      selected: isSelected,
      title: Text(languageTitle),
      trailing: Icon(isSelected?  Icons.check : null),
      onTap: (){
          context.setLocale( Locale(languageName, languageCode));
          selectedIndex = selectedID;
          Navigator.pop(context);
      },
    );
  }
  
}