import 'package:get/get.dart';
import 'package:zaitoontech/components/getX_controllers/xController.dart';
import 'package:zaitoontech/services/components/dialog_helper.dart';
import '../components/function_methods/env.dart';
import '../screens/home/home_screen.dart';
import '../setting_search.dart';
import 'components/base_client.dart';
import 'components/error_handler.dart';

class HttpServices with BaseController {
  final controller = Get.put(XController());
  List<Search> mySetting = settings;
  // Future<List<ShippingModel>> getShipping() async {
  //   var uri = Uri.parse("http://zaitoon.tech/API/transport/allShipping.php");
  //   String cTypeUrl = "http://zaitoon.tech/API/transport/allShipping.php";
  //   var response = await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
  //   var decodeDate = jsonDecode(res.body.toString());
  //   if (res.statusCode == 200){
  //     for (Map<String, dynamic> i in decodeDate) {
  //       shippingList.add(ShippingModel.fromJson(i));
  //     }
  //     return shippingList;
  //   } else {
  //     return shippingList;
  //   }
  // }

   void personalSignUp(firstName, lastName, cellPhone, userName, userPass) async{
    showLoading();
    var data = {
      "firstName": firstName,
      "lastName": lastName,
      "cellPhone": cellPhone,
      "userName": userName,
      "userPass": userPass
    };
    var response = await BaseClient().post("http://zaitoon.tech/API/", "signupPersonal.php", data).catchError(handleError);
    String result = response['msg'];
    if(result == "Exists"){
      print(response);
      hideLoading();
      DialogHelper.showErrorDialog(description: "Account Already exist, please choose another name",title: "Operation Failed!");
    }else if(result == "Failed"){
      print(response);
      hideLoading();
      DialogHelper.showErrorDialog(description: "Failed to create account, try again later",title: "Operation Failed");
    }else{
      print(response);
      hideLoading();
      DialogHelper.showErrorDialog(description: "Operation Succeed",title: "You have successfully created account");
    }
  }

  login(context) async{
    showLoading();
    var data = {
      "userName": Env.uName.text,
      "userPass": Env.uPassword.text
    };
    var response = await BaseClient().post("http://zaitoon.tech/API", "/login.php", data).catchError(handleError);
    String result = response["perID"];
    if(result != "0"){
      int uStatus = int.parse(response['usrStatus']);
      if(uStatus == 1){
        hideLoading();
        controller.saveUserDetails(response);
        controller.rememberMe();
        Env.jumpScreen(context, HomeScreen());
        //Get.to(()=> const HomeScreen());
        print("status: $uStatus");
      }else{
        print("result is: $result");
        print("your status is: $uStatus");
      }
    }else if(result == "0"){
      hideLoading();
      return DialogHelper.showErrorDialog(description: "access_denied_msg",title: "access_denied");
    }
    print(response);
  }

  getData() async {
    showLoading();
    var response = await BaseClient()
        .get("http://zaitoon.tech/API/transport","/allShipping.php")
        .catchError(handleError);
    if (response == null) return null;
    hideLoading();
    print(response);
  }

  void postData() async {
    showLoading();
    var request = {"ZAITOON": "ZAITOON FLIES"};
    var response = await BaseClient()
        .post("https://jsonplaceholder.typicode.com", "/posts", request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postShipping(dataBody) async {
    showLoading();
    var request = dataBody;
    var response = await BaseClient()
        .post("http://zaitoon.tech/API/transport", "/newShipping.php", request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

}
