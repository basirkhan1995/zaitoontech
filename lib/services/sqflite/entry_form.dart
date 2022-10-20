import 'package:flutter/material.dart';
import 'baseClient.dart';
import 'model.dart';

class AddContact extends StatefulWidget {
  final Contact? contact;
  const AddContact({Key? key, this.contact}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  Contact contact = Contact.empty();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtContact = TextEditingController();
  BaseClientSQLite controller = BaseClientSQLite();

  void initializeContact() {
    if (widget.contact != null) {
      txtName.text = widget.contact!.name;
      txtContact.text = widget.contact!.contact;
      contact = widget.contact!;
    }
  }

  void saveContact() {
    contact.name = txtName.text;
    contact.contact = txtContact.text;
    if (contact.id == null) {
      addContact();
      return;
    }
    updateContact();
  }

  void addContact() async {
    try {
      Contact result = await controller.add(contact);
      contact.id = result.id;
      message('Contact has successfully added');
      setState(() {});
    } catch (error) {
      print(error);
      message('Failed to add record');
    }
  }

  void updateContact() async {
    try {
      if (await controller.update(contact)) {
        message('update succeed');
        return;
      }
      message('no record updated');
    } catch (error) {
      print(error);
      message('Failed to update the record');
    }
  }

  void delete() async {
    try {
      if (contact.id != null) {
        if (await controller.delete(contact)) {
          message('Contact has successfully deleted');
          Navigator.pop(context);
          return;
        }
        message('No Contact has been deleted');
      }
      message('No contact to delete');
    } catch (error) {
      print(error);
      message('Failed to Delete');
    }
  }

  void message(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: txtName,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Field is required';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: txtContact,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Contact',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveContact();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          contact.id == null
                              ? print('we are unable to delete')
                              : delete();
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                          contact.id == null ? Colors.grey : Colors.red,
                        ),
                        child: const Text('Delete'),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

