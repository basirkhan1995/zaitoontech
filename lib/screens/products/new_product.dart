import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/methods/app_header.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: addNewProductMobile(), tablet: addNewProductTablet(), desktop: addNewProductDesktop());
  }
  Widget addNewProductMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("AddNewProduct").tr(),
        ),
        body: const Text("AddNewProduct Mobile"));
  }
  Widget addNewProductTablet(){
    return  Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.contact_phone_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("AddNewProduct").tr(),
        ),
        body: const Text("AddNewProduct Tablet"));
  }
  Widget addNewProductDesktop(){
    return Scaffold(
        body: Column(
          children: const [
            AppHeader(title: "AddNewProduct",leadingIcon: Icons.add_shopping_cart_rounded),
            Text("AddNewProduct desktop"),
          ],
        ));
  }


}
