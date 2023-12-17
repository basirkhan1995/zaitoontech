import 'package:flutter/cupertino.dart';
import 'package:flutter_locales/flutter_locales.dart';

class UiProvider extends ChangeNotifier{

  //Language Switch
  void switchLanguage(context, languageCode) async {
    Locales.change(context, languageCode);
    notifyListeners();
  }

  initialize()async{

    notifyListeners();
  }

}