import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:zaitoontech/Views/Authentication/Signup/signup.dart';
import '../../../../components/Colors/colors.dart';
import '../../../API Services/Json/business_json.dart';
import '../../../Components/Methods/button.dart';
import '../../../Components/Methods/responsive.dart';
import '../../../Env/env.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BusinessCategory extends StatefulWidget {
  const BusinessCategory({Key? key}) : super(key: key);

  @override
  State<BusinessCategory> createState() => _BusinessCategoryState();
}

class _BusinessCategoryState extends State<BusinessCategory> {

  late Future<List<CompanyTypes>> types;
  int currentIndex = 0;
  bool selected = false;
  int? categoryType;

  @override
  void initState() {
    super.initState();
    types = getCompanyType();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: ScreenLayout(
          mobile: mobile(),
          tablet: tablet(),
          desktop: desktop(),
        ));
  }

  Widget mobile() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text("business_msg",style: TextStyle(color: primaryColor,fontSize: 16),),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
          elevation: 0,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios,size: 18),

          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder(
                  future: types,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const SpinKitCircle(color: primaryColor);
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SpinKitCircle(
                        color: primaryColor,
                        size: 100,
                      );
                    } else {
                      return SizedBox(
                        width: 400,
                        child: GridView.builder(
                          itemCount: snapshot.data?.length,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var cTypes = snapshot.data[index];
                            selected = currentIndex == index;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                  categoryType = int.parse(cTypes.ctpId);
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: selected? primaryColor : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 0), //(x,y)
                                        blurRadius: 1.0,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                  margin: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${cTypes.ctpName}",
                                          style: TextStyle(
                                              fontSize: selected? 16 : 14,
                                              fontWeight: selected? FontWeight.bold :FontWeight.w400,
                                              color: selected? Colors.white: primaryColor)),
                                      //Text(cTypes.ctpId)
                                    ],
                                  )),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
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
                  onTap: () =>Env.back(context),
                  radius: 6,
                ),
                const SizedBox(width: 10),
                ZButton(
                  fontSize: 16,
                  label: "next",
                  width: .4,
                  onTap: () {
                    //Get.to(()=>SignUpScreen(companyType: categoryType!));
                    //print("Hello types: $categoryType");
                  },
                  radius: 6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget tablet() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const LocaleText("business_msg",style: TextStyle(color: primaryColor,fontSize: 16),),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
          elevation: 0,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios,size: 18),

          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder(
                  future: types,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const SpinKitCircle(color: primaryColor);
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SpinKitCircle(
                        color: primaryColor,
                        size: 100,
                      );
                    } else {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          itemCount: snapshot.data?.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var cTypes = snapshot.data[index];
                            selected = currentIndex == index;
                            return InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                  categoryType = int.parse(cTypes.ctpId);
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: selected? primaryColor : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 0), //(x,y)
                                        blurRadius: 1.0,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                  margin: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${cTypes.ctpName}",
                                          style: TextStyle(
                                              fontSize: selected? 16 :14,
                                              fontWeight: selected? FontWeight.bold :FontWeight.w400,
                                              color: selected? Colors.white: primaryColor)),
                                      //Text(cTypes.ctpId)
                                    ],
                                  )),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                ZButton(
                  label: "cancel",
                  width: .4,
                  onTap: ()=> Env.back(context),
                  radius: 6,
                ),
                const SizedBox(width: 10),
                ZButton(
                  label: "next",
                  width: .4,
                  onTap: () {
                    Env.goto( const Signup(), context);
                   // Get.to(()=>SignUpScreen(companyType: categoryType!));
                    //print("Hello types: $categoryType");
                  },
                  radius: 6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget desktop() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height *.1),
             const ListTile(
              title: LocaleText("business_title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              subtitle: LocaleText("business_msg",style: TextStyle(color: Colors.grey),),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder(
                  future: types,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const SpinKitCircle(color: primaryColor);
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SpinKitCircle(
                        color: primaryColor,
                        size: 100,
                      );
                    } else {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          itemCount: snapshot.data?.length,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var cTypes = snapshot.data[index];
                            selected = currentIndex == index;
                            return InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                  categoryType = int.parse(cTypes.ctpId);
                                  Env.goto(Signup(type: categoryType), context);
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: selected? primaryColor : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 0), //(x,y)
                                        blurRadius: 1.0,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                  margin: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LocaleText("${cTypes.ctpName}",
                                          style: TextStyle(
                                              fontSize: selected? 16 : 14,
                                              fontWeight: selected? FontWeight.bold :FontWeight.w400,
                                              color: selected? Colors.white: primaryColor)),
                                      //Text(cTypes.ctpId)
                                    ],
                                  )),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


  //Get method
  Future<List<CompanyTypes>> getCompanyType() async {
    final response = await http.post(Uri.parse("https://zaitoon.tech/API/companyCategory.php"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<CompanyTypes> types = items.map<CompanyTypes>((json) {
      return CompanyTypes.fromJson(json);
    }).toList();
    return types;
  }

}
