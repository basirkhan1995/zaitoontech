import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/custom_tile.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/colors/colors.dart';
import '../../components/methods/app_header.dart';

class Currency extends StatelessWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: currencyMobile(), tablet: currencyTablet(), desktop: currencyDesktop());
  }
  Widget currencyMobile(){
    return Scaffold(
        appBar: AppBar(
          title: const Text("currency"),
        ),
        body: const Text("currency Mobile"));
  }
  Widget currencyTablet(){
    return  Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  splashRadius: 20,
                  splashColor: kGrey,
                  focusColor: kGrey,
                  hoverColor: kGrey.withOpacity(.7),
                  onPressed: (){}, icon: const Icon(Icons.edit,size: 20,)),
            )
          ],
          title: const Text("currency"),
        ),
        body: Card(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("USD"),
                trailing: Text("88.50"),
              ),
             const Divider(endIndent: 10,indent: 10),
              const ListTile(
                leading: Icon(Icons.currency_lira),
                title: Text("Lira"),
                trailing: Text("18.50"),
              ),
              const Divider(endIndent: 10,indent: 10),
              const ListTile(
                leading: Icon(Icons.currency_rupee),
                title: Text("Rupee"),
                trailing: Text("400.30"),
              ),
              const Divider(endIndent: 10,indent: 10),
              const ListTile(
                leading: Icon(Icons.currency_yen_sharp),
                title: Text("Yen"),
                trailing: Text("22.50"),
              ),
              const Divider(endIndent: 10,indent: 10),
              const ListTile(
                leading: Icon(Icons.currency_pound),
                title: Text("Pound"),
                trailing: Text("98.50"),
              ),
            ],
          ),
        ));
  }
  Widget currencyDesktop(){
    return Scaffold(body: Column(
      children: const [
        AppHeader(title: "currency",leadingIcon: Icons.arrow_back_ios_new_outlined,routeIndex: 5),
        Text("currency desktop"),
      ],
    ));
  }


}
