import 'model.dart';

class DatabaseHelper{

  static const createDatabase = '''
  CREATE TABLE "contacts" (
    `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`	TEXT,
    `contact`	TEXT
  );
  ''';

  static String selectContact() {
    return 'select * from contacts;';
  }

  static String addContact(Contact contactController) {
    return '''
    insert into contacts (name, contact)
    values ('${contactController.name}', '${contactController.contact}');
    ''';
  }

  static String updateContact(Contact contactController) {
    return '''
    update contacts
    set name = '${contactController.name}',
    contact = '${contactController.contact}'
    where id = ${contactController.id};
    ''';
  }

  static String deleteContact(Contact contactController) {
    return 'delete from contacts where id = ${contactController.id};';
  }

  //.................................................................................

  static const customers = '''
  create table if not exists "tbl_customer" (
    `cId`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `cName`	TEXT,
    `cPhone` TEXT,
    'cEmail' Text,
  );
  ''';


  static String selectCustomer() {
    return 'select * from customers;';
  }

  static String addCustomer(Contact controller) {
    return '''
    insert into customers (cName,cPhone,cEmail)
    values ('${controller.contact}', '${controller.contact}');
    ''';
  }

  static String updateCustomer(Contact contactController) {
    return '''
    update contacts
    set name = '${contactController.name}',
    contact = '${contactController.contact}'
    where id = ${contactController.id};
    ''';
  }


}