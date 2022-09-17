import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaitoontech/screens/users/login.dart';

class XController extends GetxController {

  @override
  void onInit() async {
    getUserDetailsState();
    getSwitchState();
    super.onInit();
  }

  final strongPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final validEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final xStorage = GetStorage();
  final txtPassword = TextEditingController();
  final txtConfirmPassword = TextEditingController();

  //Booleans
  RxBool isPasswordStrong = false.obs;
  RxBool isEmailValidated = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool searchOn = false.obs;

  var isInvisible = true.obs;
  var isNestedNavigation = false;
  var isExtended = true;
  var isSelected = false;
  var subMenuExtended = false;
  var isLoginSucceed = false;
  //Menu Role Booleans
  var isSwitchOn = false;
  var isProfileOn = false;
  var isSalesOn = false;
  var isFinance = false;
  var isSettings = false;

  // UserDetails
  var userName = "";
  var phone = "";
  var userRole = "";
  var branchName = "";
  var companyName = "";
  var branchCompany = "";
  var branchID = "";
  var branchAddress = "";
  var companyLogo = "";
  var firstName = "";
  var lastName = "";
  var email = "";
  var city = "";
  var userSystemID = "";

   void saveUserDetails(response){
   xStorage.write('usrName', response["usrName"]);
   xStorage.write('perFirstName', response["perFirstName"]);
   xStorage.write('perLastName', response["perLastName"]);
   xStorage.write('perNIDNo', response["perNIDNo"]);
   xStorage.write('brcID', response["brcID"]);
   xStorage.write('perPhone', response["perPhone"]);
   xStorage.write('usrRole', response["usrRole"]);
   xStorage.write('brcName', response["brcName"]);
   xStorage.write('comName', response["comName"]);
   xStorage.write('brcCompany', response["brcCompany"]);
   xStorage.write('brcAddress', response["brcAddress"]);
   xStorage.write('comLogo', response["comLogo"]);
   xStorage.write('perEmail', response["perEmail"]);
   xStorage.write('perCity', response["perCity"]);
 }

   void getUserDetailsState(){
    userName = (xStorage.read("usrName") ?? "");
    firstName = (xStorage.read("perFirstName") ?? "");
    lastName = (xStorage.read("perLastName") ?? "");
    userSystemID = (xStorage.read("perNIDNo") ?? "");
    branchID = (xStorage.read("brcID") ?? "");
    phone = (xStorage.read("perPhone") ?? "");
    userRole = (xStorage.read("usrRole") ?? "");
    branchName = (xStorage.read("brcName") ?? "");
    companyName = (xStorage.read("comName") ?? "");
    branchCompany = (xStorage.read("brcCompany") ?? "");
    branchAddress = (xStorage.read("brcAddress") ?? "");
    companyLogo = (xStorage.read("comLogo") ?? "");
    email = (xStorage.read("perEmail") ?? "");
    city = (xStorage.read("perCity") ?? "");
  }

  int? languageIndex;
  var selectedLanguage = false;

  int currentIndex = 0;
  int menuID = 0;
  int subMenuID = 51;




  getSwitchState(){
    isProfileOn = (xStorage.read("profile") ?? false);
    isSalesOn = (xStorage.read("sales") ?? false);
    isFinance = (xStorage.read("finance") ?? false);
    isSettings = (xStorage.read("settings") ?? false);
    isLoginSucceed = (xStorage.read("rememberLogin") ?? false);
    update();
  }

  //General Set Routes
  setRoute(int id){
    menuID = id;
    update();
  }

  //Settings Route Set ID
  setSubRoute(int id){
    subMenuID = id;
    update();
  }

  //Save Login
  rememberMe(){
    isLoginSucceed = true;
    xStorage.write('rememberLogin', isLoginSucceed);
    update();
  }

  //SIGN OUT
  logout(){
   isLoginSucceed = false;
   xStorage.write("rememberLogin", isLoginSucceed);
   Get.to(()=> const LoginScreen());
  update();
  }

  profileSwitch(bool value){
    isProfileOn = value;
    xStorage.write("profile", isProfileOn);
    update();
  }

  settingsSwitch(bool value){
    isSettings = value;
    xStorage.write("settings", isSettings);
    update();
  }

  setMenuPermission(bool value){
    isSettings = value;
    xStorage.write("settings", isSettings);

    isProfileOn = value;
    xStorage.write("profile", isProfileOn);

    isFinance = value;
    xStorage.write("finance", isFinance);

    isSalesOn = value;
    xStorage.write("sales", isSalesOn);

    update();
  }

  financeSwitch(bool value){
    isFinance = value;
    xStorage.write("finance", isFinance);
    update();
  }

  salesSwitch(bool value){
    isSalesOn = value;
    xStorage.write("sales", isSalesOn);
    update();
  }

  changeSwitch(bool value){
    isSwitchOn = value;
    xStorage.write("switchKey", isSwitchOn);
    update();
  }


  void setData(String key, dynamic value) => GetStorage().write(key, value);
  int? getInt(String key) => GetStorage().read(key);
  String? getString(String key) => GetStorage().read(key);
  bool? getBool(String key) => GetStorage().read(key);
  double? getDouble(String key) => GetStorage().read(key);
  dynamic getData(String key) => GetStorage().read(key);
  void clearData() async => GetStorage().erase();


  //Confirm Password Validator
  String? confirmPasswordValidator(String value) {
    if (value.isEmpty) {
      return tr("password_required_msg");
    } else if (txtConfirmPassword.value != txtPassword.value)  {
      return tr("password_not_matched_msg");
    }
    return null;
  }

  //Field Required Validator
  String? inputFieldValidator(String value, hint) {
    if (value.isEmpty) {
      return tr("$hint required");
    }
    return null;
  }

  //Email Validator
  String? emailValidator(String value) {
    if (value.isEmpty) {
      return "Email is required";
    } else if (!validEmail.hasMatch(value)) {
      isEmailValidated.value = false;
      return "Email is not valid";
    } else {
      isEmailValidated.value = true;
    }
    return null;
  }

  //Strong Password Validator
  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (!strongPassword.hasMatch(value)) {
      isPasswordStrong.value = false;
      return "Strong password is required";
    } else {
      isPasswordStrong.value = true;
      return null;
    }
  }
  passwordVisible() {
    isPasswordVisible != isPasswordVisible;
  }

  passwordVerifier(){
    if(isPasswordStrong.value == true){
      return const Icon(Icons.check_circle,color: Colors.green,size: 20);
    }else{
      return const SizedBox();
    }
  }
}

