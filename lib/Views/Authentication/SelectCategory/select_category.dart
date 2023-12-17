import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:zaitoontech/Components/Colors/colors.dart';
import '../../../Components/Methods/button.dart';
import '../../../Components/Methods/responsive.dart';
import '../../../Env/env.dart';
import '../BusinessCategory/business_category.dart';
import '../Signup/signup.dart';



class SwitchAccount extends StatefulWidget {
  const SwitchAccount({super.key});

  @override
  State<SwitchAccount> createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  int selectedId = 0;

  List account = ["personal_account", "business_account"];

  List icon = [Icons.account_circle, Icons.home_work_rounded];

  List pages = <Widget>[
    const Signup(),
    const BusinessCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: mobile(), tablet: tablet(), desktop: desktop());
  }

  Widget mobile(){
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                //Icon(Icons.account_circle,size: width/ 3,color: zOlive),
                const ListTile(
                  horizontalTitleGap: 0,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  title: LocaleText(
                    "account_title",
                    style: TextStyle( fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  subtitle: LocaleText(
                    "account_hint",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        itemCount: account.length,
                        itemBuilder: (context, index) {
                          bool ifTrue = selectedId == index;
                          return InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                selectedId = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                color: ifTrue ? primaryColor : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(icon[index],
                                      size: ifTrue ? 45 : 35,
                                      color: ifTrue ? Colors.white : Colors.black45),
                                  LocaleText(
                                    account[index],
                                    style: TextStyle(
                                        fontSize: ifTrue ? 16 : 15,
                                        color: ifTrue ? Colors.white : Colors.black45,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    ZButton(
                      fontSize: 16,
                      label: "cancel",
                      width: .4,
                      onTap: () {
                        Env.back(context);
                      },
                      radius: 6,
                    ),
                    const SizedBox(width: 15),
                    ZButton(
                      fontSize: 16,
                      label: "next",
                      width: .4,
                      onTap: () {
                        Env.goto(pages[selectedId], context);
                      },
                      radius: 6,
                    ),


                  ],
                )
              ],
            ),
          ),
        ));
  }
  Widget tablet(){
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 15),
              //Icon(Icons.account_circle,size: width/ 3,color: zOlive),
              const ListTile(
                horizontalTitleGap: 0,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                title: Text(
                  "account_type_message",
                  style: TextStyle( fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: account.length,
                    itemBuilder: (context, index) {
                      bool ifTrue = selectedId == index;
                      return InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedId = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width * .4,
                          height: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                            color: ifTrue ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(icon[index],
                                  size: ifTrue ? 20 : 18,
                                  color: ifTrue ? Colors.white : Colors.black45),
                              Text(
                                account[index],
                                style: TextStyle(
                                    fontSize: ifTrue ? 16 : 14,
                                    color: ifTrue ? Colors.white : Colors.black45,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ZButton(
                    fontSize: 16,
                    label: "cancel",
                    width: .4,
                    onTap: () {
                      Env.back(context);
                    },
                    radius: 6,
                  ),
                  const SizedBox(width: 15),
                  ZButton(
                    fontSize: 16,
                    label: "next",
                    width: .4,
                    onTap: () {
                      Env.goto(pages[selectedId], context);
                    },
                    radius: 6,
                  ),


                ],
              )
            ],
          ),
        ));
  }

  Widget desktop(){
    return Scaffold(
        body: Row(
          children: [

            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  const ListTile(
                    horizontalTitleGap: 0,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                    title: Text(
                      "account_type_message" ,
                      style: TextStyle( fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        itemCount: account.length,
                        itemBuilder: (context, index) {
                          bool ifTrue = selectedId == index;
                          return InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                selectedId = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                              height: MediaQuery.of(context).size.height *.4,

                              decoration: BoxDecoration(
                                color: ifTrue ? primaryColor : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(icon[index],
                                          size: ifTrue ? 20 : 18,
                                          color: ifTrue ? Colors.white : Colors.black45),
                                      Text(
                                        account[index],
                                        style: TextStyle(
                                            fontSize: ifTrue ? 16 : 14,
                                            color: ifTrue ? Colors.white : Colors.black45,fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),


                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Expanded(
                            child: ZButton(
                              height: 60,
                              fontSize: 16,
                              label: "cancel",

                              onTap: () =>Env.back(context),
                              radius: 6,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: ZButton(
                              height: 60,
                              fontSize: 16,
                              label: "next",
                              onTap: () {
                               Env.goto(pages[selectedId], context);
                              },
                              radius: 6,
                            ),
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor.withOpacity(.09),
                      image: const DecorationImage(
                        image: AssetImage("assets/photos/zLogo.png"),
                      )
                  ),
                )),
          ],
        ));
  }
}
