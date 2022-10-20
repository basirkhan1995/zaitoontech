import 'package:sqflite/sqflite.dart';
import 'connection_sqlite.dart';
import 'database.dart';
import 'model.dart';

class BaseClientSQLite{
  final ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async {
    return await _connection.db;
  }

  Future<Contact> add(Contact contact) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(DatabaseHelper.addContact(contact));
      contact.id = id;
      return contact;
    } catch (error) {
      throw Exception();
    }
  }

  Future<Contact> addRecord(dynamic model) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(DatabaseHelper.addContact(model));
      model.id = id;
      return model;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> update(Contact contact) async {
    try {
      Database db = await _getDatabase();
      int result =
      await db.rawUpdate(DatabaseHelper.updateContact(contact));
      if (result > 0) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<Contact>> select() async {
    try {
      Database db = await _getDatabase();
      List<Map> row =
      await db.rawQuery(DatabaseHelper.selectContact());
      List<Contact> contact = Contact.fromSQLiteList(row);
      return contact;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> delete(Contact contact) async {
    try {
      Database db = await _getDatabase();
      int deleteRow =
      await db.rawUpdate(DatabaseHelper.deleteContact(contact));
      if (deleteRow > 0) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception();
    }
  }
}