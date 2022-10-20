import 'package:flutter/material.dart';
import 'package:zaitoontech/screens/menu/hr_menu/new_employee.dart';
import 'package:zaitoontech/screens/menu/hr_menu/salary_management.dart';
import 'package:zaitoontech/screens/menu/hr_menu/stakeholders.dart';
import 'package:zaitoontech/screens/menu/operation/deposit.dart';
import 'package:zaitoontech/screens/menu/operation/stakeholders.dart';
import 'package:zaitoontech/screens/menu/operation/withdraw.dart';
import 'package:zaitoontech/screens/products/new_product.dart';
import 'package:zaitoontech/screens/products/products.dart';
import 'package:zaitoontech/screens/settings/about_app.dart';
import 'package:zaitoontech/screens/settings/change_password.dart';
import 'package:zaitoontech/screens/settings/company_info.dart';
import 'package:zaitoontech/screens/settings/contact_us.dart';
import 'package:zaitoontech/screens/settings/privacy.dart';
import 'package:zaitoontech/screens/settings/profile_settings.dart';
import 'package:zaitoontech/services/sqflite/contato_page.dart';
import '../../screens/menu/hr_menu/users.dart';
import '../../screens/menu/dashboard.dart';
import '../../screens/menu/finance.dart';
import '../../screens/menu/reports.dart';
import '../../screens/settings/currency.dart';
import '../../screens/settings/settings.dart';

class MenuScreens extends StatelessWidget {
  final int id;
  const MenuScreens({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return jumpToMenu(id);
  }
  static Widget jumpToMenu(int id){
    switch (id){
      case 0: return const Dashboard();

      //Finance
      case 1: return const Finance();

      //Operations Case
      case 2: return const StakeHolders();
      case 21:
        return const Withdraw();
      case 22:
        return const Deposit();

      //HRM Case
      case 3:
        return const NewEmployee();
      case 31:
        return const Users();
      case 32:
        return const SalaryManagement();
      case 300:
        return const MyUsers();

      //Reports Case
      case 4:
        return const Reports();

      //Setting Case
      case 5:
        return const Settings();
      case 50:
        return const CompanyInfo();
      case 51:
        return const UserProfile();
      case 52:
        return const PrivacySettings();
      case 53:
        return const ChangePassword();
      case 54:
        return const ContactUs();
      case 55:
        return const AboutApp();
      case 56:
        return const Currency();

        //Products
      case 6:
        return const Products();
      case 61:
        return const AddNewProduct();

        //Empty Case
      case 100:
        return const SizedBox();

      default:
        return const Dashboard();
    }
  }
}