import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import '../../components/colors/colors.dart';

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
          leading: const Icon(Icons.currency_bitcoin_outlined),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
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
          title: const Text("currency").tr(),
        ),
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blueGrey.shade100)
          ),
          margin: const EdgeInsets.all(10),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
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
                          fontSize: 16,
                          color: Colors.blueGrey.shade100),
                    ),
                  ),
                  const SizedBox(height:10),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: 7,
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
                                  const SizedBox(width: 10),
                                  Text("Pound",style: TextStyle(color: Colors.blueGrey.shade300),),
                                  const SizedBox(width: 10),
                                  Text("\$ 98.5",style: TextStyle(color: Colors.blueGrey.shade300),),
                                  const SizedBox(width: 10),
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
        ));
  }
  Widget currencyDesktop(){
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.currency_bitcoin_outlined),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          title: const Text("currency"),
        ),
        body: Column(
         children: const [
        Text("currency desktop"),
      ],
    ));
  }


}
