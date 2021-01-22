import "package:flutter/material.dart";
import 'package:contacts/hive_functions.dart';
import 'package:hive/hive.dart';
import 'package:contacts/constants.dart';
import 'package:contacts/models/contact.dart';
import 'package:contacts/screens/update_contact_screen.dart';

Widget contactsList(Box box, BuildContext context) {
  return ListView.builder(
      itemCount: box.length,
      itemBuilder: (context, index) {
        final contact = box.getAt(index) as Contact;
        final image = MemoryImage(contact.profileImage);
        return Card(
          elevation: 10,
          color: Color(0xffffcc29),
          child: ListTile(
              leading: Container(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundImage: image,
                  backgroundColor: Color(0xffffcc29),
                ),
              ),
              title: Text(
                contact.name,
                style: mainTextStyle,
              ),
              subtitle: Text(
                contact.phoneNumber,
                style: mainTextStyle,
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdateContact(
                            name: contact.name,
                            phoneNumber: contact.phoneNumber,
                            image: contact.profileImage,
                            index: index,
                            handleUpdate: handleUpdateContact,
                            contactContext: context,
                          );
                        }));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () {
                        handleDeleteContact(index, context);
                      },
                    ),
                  ],
                ),
              )),
        );
      });
}
