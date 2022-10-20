import 'package:flutter/material.dart';
import 'baseClient.dart';
import 'entry_form.dart';
import 'model.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contact = [];
  BaseClientSQLite controller = BaseClientSQLite();

  void selectContactList() async {
    try {
      List<Contact> result = await controller.select();
      contact.clear();
      contact.addAll(result);
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to to insert data')));
    }
  }

  @override
  void initState() {
    selectContactList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddContact(),
              )).then((value) => selectContactList());
        },
      ),
      body: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: contact.length,
        itemBuilder: (context, index) {
          Contact controller = contact[index];
          return ListTile(
            title: Text(controller.name),
            subtitle: Text(controller.contact),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddContact(
                      contact: controller,
                    ),
                  )).then((value) => selectContactList());
            },
          );
        },
      ),
    );
  }
}


