import 'package:flutter/material.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/screens/users/business%20_categories.dart';
import 'package:zaitoontech/screens/users/business_signup.dart';
import 'package:zaitoontech/screens/users/login.dart';
import 'package:zaitoontech/screens/users/personal_account.dart';
import '../../components/function_methods/env.dart';
import '../../components/methods/screen_layout.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectGoal extends StatefulWidget {
  const SelectGoal({Key? key}) : super(key: key);

  @override
  State<SelectGoal> createState() => _SelectGoalState();
}

class _SelectGoalState extends State<SelectGoal> {
  List item = [
    tr("personal"),
    tr("business"),
  ];
  List screens = [
    const PersonalSignup(),
    const BusinessCategory(),
  ];
  int currentIndex = 0;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenLayout(
        mobile: goalMobile(context),
        tablet: goalTablet(context),
        desktop: goalDesktop(context),
      ),
    );
  }

  goalMobile(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/photos/statistics.png',
                width: 150,
              ),
              const SizedBox(height: 30),
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      //Env.jumpScreen(context, const PersonalSignup());
                    },
                    child: Container(
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.green,
                          ),
                          const Text(
                            'personal',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ).tr()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      //Env.jumpScreen(context, const BusinessCategory());
                    },
                    child: Container(
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.work,
                            size: 60,
                            color: Colors.green,
                          ),
                          const Text(
                            'business',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ).tr()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  goalTablet(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/photos/statistics.png',
              width: 200,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //Env.jumpScreen(context, const PersonalSignup());
                  },
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.green,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.green,
                        ),
                        const Text(
                          'personal',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    //Env.jumpScreen(context, const BusinessCategory());
                  },
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.green,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.work,
                          size: 60,
                          color: Colors.green,
                        ),
                        const Text(
                          'business',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ).tr()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goalDesktop(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const ListTile(
              title: Text("Select your account category.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            const SizedBox(height: 20),
            GridView.builder(
                shrinkWrap: true,
                itemCount: item.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  selected = currentIndex == index;
                  return Stack(
                    fit: StackFit.loose,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        hoverColor: Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: 350,
                          height: 180,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: selected
                                      ? kBlue
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              color: kBlue.withOpacity(.15)),
                          child: Center(
                            child: Text(item[index]),
                          ),
                        ),
                      ),
                     Positioned(
                       top: 15,
                          left: 15,
                          child: selected?const Icon(Icons.check_circle,color: kBlue,size: 20,):const SizedBox()),
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                       border: Border.all(color: kBlue),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text("Back",style: TextStyle(color: kBlue),)),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: TextButton(
                      onPressed: (){
                        Env.jumpScreen(context, screens[currentIndex]);
                      }, child: const Text("Next",style: TextStyle(color: kWhite),)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
