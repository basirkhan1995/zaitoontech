import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/components/methods/dashboardUi.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController controller = ScrollController();
  final provider = Get.put(XController());

  @override
  void initState() {
    //This is the line which only get called one time and use myFuture in FutureBuilder call.
    // myFuture = HttpServices().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: dashboardMobile(),
        tablet: dashboardTablet(),
        desktop: dashboardDesktop());
  }

  Widget dashboardMobile() {
    return const Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(title: Text("Dashboard"),),
        body: Text("Dashboard Mobile"));
  }

  Widget dashboardTablet() {
    return const Scaffold(
        backgroundColor: Colors.white, body: Text("Dashboard Tablet"));
  }

  Widget dashboardDesktop() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // AppHeader(
          //   title: "company_title",
          //   leadingIcon: Icons.home_filled,
          //   searchHint: tr("search_home"),
          //   onSearch: () {
          //     setState(() {
          //       Env.searchOn = true;
          //     });
          //   },
          // ),
          //const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                SizedBox(
                    child: Image.asset('assets/zLogo.png')),
                  SizedBox(
                  height: 40,
                  width: 500,
                  child: ListTile(
                    title: Text("Welcome, ${provider.companyName}",style: const TextStyle(fontSize: 25),).tr(),
                     subtitle: const Text("dashboard_msg").tr(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Expanded(
                  child: DashboardComponents(
                    scores: 0.4,
                    title: "clients",
                    subtitle: "32500",
                  ),
                ),
                Expanded(
                  child: DashboardComponents(
                    scores: 0.9,
                    color: uiColor2,
                    icon: Icons.shopping_cart,
                    title: "products",
                    subtitle: "450",
                  ),
                ),
                Expanded(
                  child: DashboardComponents(
                    scores: 0.8,
                    color: uiColor3,
                    icon: Icons.shopping_basket,
                    title: "sales",
                    subtitle: "29500",
                  ),
                ),
                Expanded(
                  child: DashboardComponents(
                    scores: 0.3,
                    color: uiColor4,
                    icon: Icons.add_chart,
                    title: "revenue",
                    subtitle: "6500",
                  ),
                ),
                Expanded(
                  child: DashboardComponents(
                    scores: 0.5,
                    color: uiColor5,
                    icon: Icons.monetization_on_rounded,
                    title: "expenses",
                    subtitle: "9500",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.blueGrey.shade100),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height:10),
                              const Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Text(
                                  "Recent Transactions",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                              const SizedBox(height:10),
                              Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: 4,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.blueGrey.withOpacity(.35),width: 1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        margin: const EdgeInsets.only(bottom: 10.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:  [
                                             Icon(Icons.access_time_filled_outlined,color: Colors.blueGrey.shade300,),
                                              const SizedBox(width: 10),
                                              Text("Deposit",style: TextStyle(color: Colors.blueGrey.shade400),),
                                              const SizedBox(width: 10),
                                              Text("Ahmadi LTD",style: TextStyle(color: Colors.blueGrey.shade400),),
                                              const SizedBox(width: 10),
                                              Text("\$ 5400",style: TextStyle(color: Colors.blueGrey.shade400),),
                                              const SizedBox(width: 10),
                                              Text("5:40 PM",style: TextStyle(color: Colors.blueGrey.shade400),),


                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height:10),
                                Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Currency Rates",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueGrey.shade300),
                                ),
                              ),
                              const SizedBox(height:10),
                              Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: 4,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.blueGrey.withOpacity(.35),width: 1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        margin: const EdgeInsets.only(bottom: 10.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:  [
                                              Icon(Icons.currency_pound_outlined,color: Colors.blueGrey.shade300,),
                                              SizedBox(width: 10),
                                              Text("Pound",style: TextStyle(color: Colors.blueGrey.shade300),),
                                              SizedBox(width: 10),
                                              Text("\$ 98.5",style: TextStyle(color: Colors.blueGrey.shade300),),
                                              SizedBox(width: 10),
                                              Text("5:00 PM",style: TextStyle(color: Colors.blueGrey.shade300),),


                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
