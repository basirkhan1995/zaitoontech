import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/methods/app_header.dart';
import 'package:zaitoontech/components/methods/custom_tile.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/function_methods/env.dart';
import '../../services/jsonModel/shippingModel.dart';
import '../../setting_search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future? myFuture;
  List<ShippingModel> shippingList = [];
  List<Search> mySetting = settings;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    //This is the line which only get called one time and use myFuture in FutureBuilder call.
    // myFuture = HttpServices().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(mobile: dashboardMobile(), tablet: dashboardTablet(), desktop: dashboardDesktop());
  }

  Widget dashboardMobile(){
    return const Scaffold(
      backgroundColor: Colors.white,
        //appBar: AppBar(title: Text("Dashboard"),),
        body: Text("Dashboard Mobile"));
  }

  Widget dashboardTablet(){
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Text("Dashboard Tablet"));
  }

  Widget dashboardDesktop(){
    return Scaffold(
      body: Column(
        children: [
             AppHeader(title: "dashboard",leadingIcon: Icons.home_rounded, searchHint: tr("search_home"),
             onSearch: (){
               setState(() {
                 Env.searchOn = true;
               });
             },
             ),
             const SizedBox(height: 10),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(8),
                 child: ListView.builder(
                   controller: controller,
                     physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: settings.length,
                 itemBuilder: (context, index){
                   final controller = settings[index];
                  return CustomTile(
                      leading: Icons.access_time_filled ,
                      title: controller.title,
                  subTitle: controller.subtitle,
                  );

                 }),
               ),
             ),


          // FutureBuilder(
          //   future: myFuture,
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (!snapshot.hasData) {
          //       return const CircularProgressIndicator(color: kBlue,);
          //     } else if (snapshot.hasData && snapshot.data.isEmpty) {
          //       return  Text("Empty");
          //     } else if (snapshot.hasError) {
          //       print("  here");
          //
          //       return const Text('Error');
          //     } else {
          //       print("Data is here");
          //       List<ShippingModel> posts = snapshot.data;
          //       return SingleChildScrollView(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          //           child: DataTable(
          //             checkboxHorizontalMargin: 10,
          //             decoration: const BoxDecoration(
          //                 borderRadius: BorderRadius.all(Radius.circular(8))
          //             ),
          //             headingRowColor: MaterialStateProperty.all(kBlue.withOpacity(.03)),
          //             showCheckboxColumn: true,
          //             sortAscending: true,
          //             dataRowHeight: 45,
          //             columnSpacing: 12,
          //             dividerThickness: .7,
          //             columns: [
          //               //DataColumn(label: Text("id")),
          //               DataColumn(label: const Text("consignment_no") ),
          //               DataColumn(label: const Text("container_no") ),
          //               DataColumn(label: const Text("shipping_from") ),
          //               DataColumn(label: const Text("shipping_to") ),
          //               DataColumn(label: const Text("loaded_date") ),
          //               DataColumn(label: const Text("arrival_date") ),
          //               DataColumn(label: const Text("remarks") ),
          //               DataColumn(label: const Text("status") ),
          //               DataColumn(label: const Text("add") ),
          //               DataColumn(label: const Text("view") ),
          //
          //             ],
          //             rows: posts.map((ShippingModel post) =>
          //                 DataRow(
          //                     cells: [
          //                       //DataCell(Text(post.shpId)),
          //                       DataCell(Text(post.shpConsignmentNo)),
          //                       DataCell(Text(post.shpContainerNo)),
          //                       DataCell(Text(post.shpFrom)),
          //                       DataCell(Text(post.shpTo)),
          //                       DataCell(Text(post.shpMoveDate)),
          //                       DataCell(Text(post.shpArriveDate)),
          //                       DataCell(Text(post.shpRemarks)),
          //                       const DataCell(Text("Pending")),
          //                       DataCell(
          //                           Container(
          //                             height: 35,
          //                             width: 35,
          //                             decoration: BoxDecoration(
          //                                 color: kBlue.withOpacity(.03),
          //                                 borderRadius: BorderRadius.circular(10)
          //                             ),
          //                             child: IconButton(
          //                                 onPressed: () {
          //                                 },
          //                                 icon: const Icon(Icons.add, size: 19)),
          //                           )),
          //                       DataCell(
          //                           Container(
          //                             height: 35,
          //                             width: 35,
          //                             decoration: BoxDecoration(
          //                                 color: kBlue.withOpacity(.03),
          //                                 borderRadius: BorderRadius.circular(10)
          //                             ),
          //                             child: IconButton(
          //                                 onPressed: () {
          //
          //                                 },
          //                                 icon: const Icon(Icons.view_module_rounded, size: 19)),
          //                           )),
          //                     ])).toList(),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}