import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:zaitoontech/services/jsonModel/usersModel.dart';

class DBHelper{

  static Future<Database> initDB ()async{
    var dbPath = await getDatabasesPath();
    String path = join(dbPath,'zaitoon.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
}


 static Future _onCreate(Database db, int version) async{
    const sql = '''CREATE TABLE users(
    userId INTEGER PRIMARY KEY,
    usrFirstName TEXT, 
    usrLastName TEXT, 
    usrName TEXT, 
    usrPass TEXT, 
    usrPhone TEXT, 
    usrEmail TEXT
    )''';
    await db.execute(sql);
 }

 //Create Users Table
  static Future<int> createUser(UserModel usr) async{
    Database db = await DBHelper.initDB();
    return await db.insert('users', usr.toJson());
  }

  //Read Users
 static Future <List<UserModel>> readUsers()async{
   Database db = await DBHelper.initDB();
   var users = await db.query('users',orderBy: 'usrName');
   List<UserModel> userList = users.isNotEmpty? users.map((e) => UserModel.fromJson(e)).toList() :[];
   return userList;
  }

  //Update Users
  static Future <int> updateUsers(UserModel user)async{
    Database db = await DBHelper.initDB();
    return await db.update('users',user.toJson(),where: 'userId = ?', whereArgs: [user.userId]);
  }

  //Delete Users
  static Future <int> deleteUsers(int id)async{
    Database db = await DBHelper.initDB();
    return await db.delete('users',where: 'userId = ?', whereArgs: [id]);
  }


}