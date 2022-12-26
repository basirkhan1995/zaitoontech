import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../../components/function_methods/env.dart';
import '../../components/methods/screen_layout.dart';
import 'business_name_model.dart';
import 'business_signup.dart';

class BusinessCategory extends StatefulWidget {
  const BusinessCategory({Key? key}) : super(key: key);

  @override
  State<BusinessCategory> createState() => _BusinessCategoryState();
}

class _BusinessCategoryState extends State<BusinessCategory> {
  Future? myFuture;
  List<CTypeModel> ctList = [];
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
    myFuture = getCompanyTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //appBar: Env.appBar(),
        body: ScreenLayout(
          mobile: bcMobile(),
          tablet: bcTablet(),
          desktop: bcDesktop(),
        ));
  }

  Widget bcMobile() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: myFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: ctList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  String cIndex = "0";
                  cIndex = ctList[index].ctpId.toString();
                  return GestureDetector(
                    onTap: () async {
                      //await Env.jumpScreen(context, BusinessSignup(companyType: cIndex));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1), //(x,y)
                              blurRadius: 1.0,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Image.asset(businessName[index].businessLogo.toString(),width: 130),
                            Text(ctList[index].ctpName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green)),
                            Text(cIndex)
                          ],
                        )),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const SpinKitCircle(
                color: Colors.green,
                size: 100,
              );
            } else {
              return const Text("It has Data");
            }
          },
        ),
      ),
    );
  }
  Widget bcTablet() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: myFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: ctList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  String cIndex = "0";
                  cIndex = ctList[index].ctpId.toString();
                  return GestureDetector(
                    onTap: () async {
                      //await Env.jumpScreen(context, BusinessSignup(companyType: cIndex));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1), //(x,y)
                              blurRadius: 1.0,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Image.asset(businessName[index].businessLogo.toString(),width: 130),
                            Text(ctList[index].ctpName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green)),
                            Text(cIndex)
                          ],
                        )),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const SpinKitCircle(
                color: Colors.green,
                size: 100,
              );
            } else {
              return const Text("It has Data");
            }
          },
        ),
      ),
    );
  }
  Widget bcDesktop() {
    return Container(
      color: Colors.green,
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Expanded(
            child: FutureBuilder(
              future: myFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 400,
                    color: Colors.white,
                    child: GridView.builder(
                      itemCount: ctList.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                      ),
                      itemBuilder: (context, index) {
                        String cIndex = "0";
                        cIndex = ctList[index].ctpId.toString();
                        return GestureDetector(
                          onTap: () async {
                            await Env.jumpScreen(context, BusinessSignup(companyType: cIndex));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(1, 1), //(x,y)
                                    blurRadius: 1.0,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Image.asset(businessName[index].businessLogo.toString(),width: 130),
                                  Text(ctList[index].ctpName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green)),
                                  Text(cIndex)
                                ],
                              )),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SpinKitCircle(
                    color: Colors.green,
                    size: 100,
                  );
                } else {
                  return const Text("It has Data");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  Future<List<CTypeModel>> getCompanyTypes() async {
    String cTypeUrl = "http://zaitoon.tech/API/companyTypes.php";
    http.Response res = await http.get(Uri.parse(cTypeUrl));
    var decodeDate = jsonDecode(res.body.toString());
    if (res.statusCode == 200) {
      for (Map<String, dynamic> i in decodeDate) {
        ctList.add(CTypeModel.fromJson(i));
      }
      return ctList;
    } else {
      return ctList;
    }
  }
}
