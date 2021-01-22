import 'package:contacts/constants.dart';
import 'package:contacts/screens/add_contact_screen.dart';
import 'package:contacts/widgets/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:contacts/hive_functions.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Contacts',
          style: mainTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
      body: ValueListenableBuilder(
          valueListenable: Hive.box('contacts').listenable(),
          builder: (context, box, _) {
            if (box.values.isEmpty) {
              return Center(
                  child: Text(
                "No contacts added",
                style: mainTextStyle,
              ));
            } else {
              return contactsList(box, context);
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: bgColor,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddContact(
              handleContact: handleAddContact,
            );
          }));
        },
      ),
    );
  }
}
