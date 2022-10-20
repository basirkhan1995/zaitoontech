
class Customer {
  int? cId;
  String cName;
  String cEmail;
  String cPhone;

  Customer({
    this.cId,
    required this.cName,
    required this.cEmail,
    required this.cPhone,
  });

  factory Customer.fromSQLite(Map map) {
    return Customer(
      cId: map['id'],
      cName: map['name'],
      cEmail: map['contact'],
      cPhone: map['phone']
    );
  }

  static List<Customer> fromSQLiteList(List<Map> listMap) {
    List<Customer> contactList = [];
    for (Map item in listMap) {
      contactList.add(Customer.fromSQLite(item));
    }
    return contactList;
  }

  factory Customer.empty() {
    return Customer(cName: '', cEmail: '', cPhone: '');
  }
}