import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/methods/custom_button.dart';
import '../../components/colors/colors.dart';

class DialogHelper {
  static void showErrorDialog(
      {String? title = "Error", String? description = "Error Description"}) {
    Get.dialog(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title ?? "", style: Get.textTheme.headline5).tr(),
              const SizedBox(height: 30),
              Text(description ?? "", style: const TextStyle(fontSize: 16)).tr(),
              const SizedBox(height: 25),
              Button(
                radius: 10,
                  label: "ok",
                  onTap: () {
                    Get.back();
                  }),
            ],
          ),
      ),
    ),
        ));
  }

  static void showLoadingDialog([String? message]){
    Get.dialog(
        Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            const CircularProgressIndicator(color: kBlue,strokeWidth: 3,),
            const SizedBox(height: 8),
            Text(message??'Loading',style: Get.textTheme.labelLarge)
          ],
        ),
      ),
    ));
  }

  static void hideLoading(){
    if(Get.isDialogOpen!) Get.back();
  }

}
