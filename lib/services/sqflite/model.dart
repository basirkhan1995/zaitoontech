
class Contact {
  int? id;
  String name;
  String contact;

  Contact({
    this.id,
    required this.name,
    required this.contact,
  });

  factory Contact.fromSQLite(Map map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      contact: map['contact'],
    );
  }

  static List<Contact> fromSQLiteList(List<Map> listMap) {
    List<Contact> contactList = [];
    for (Map item in listMap) {
      contactList.add(Contact.fromSQLite(item));
    }
    return contactList;
  }

  factory Contact.empty() {
    return Contact(name: '', contact: '');
  }
}