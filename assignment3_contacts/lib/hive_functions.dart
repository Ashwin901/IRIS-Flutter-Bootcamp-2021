import 'package:contacts/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:toast/toast.dart';

void show(String message, BuildContext context) {
  Toast.show(message, context, duration: 4);
}

void handleAddContact(String name, String phoneNumber, File profileImage,
    BuildContext context) async {
  Uint8List image;
  if (profileImage == null) {
    ByteData bytes = await rootBundle.load('images/contact.png');
    image = bytes.buffer.asUint8List();
  } else {
    image = await profileImage.readAsBytes();
  }
  Contact contact =
      Contact(name: name, phoneNumber: phoneNumber, profileImage: image);
  final box = Hive.box('contacts');
  box.add(contact);
  show("Contact successfully added", context);
}

void handleUpdateContact(int index, String name, String phoneNumber,
    File profileImage, BuildContext context) async {
  Uint8List image;
  if (profileImage == null) {
    ByteData bytes = await rootBundle.load('images/contact.png');
    image = bytes.buffer.asUint8List();
  } else {
    image = await profileImage.readAsBytes();
  }
  Contact contact =
      Contact(name: name, phoneNumber: phoneNumber, profileImage: image);
  final Box box = Hive.box('contacts');
  await box.putAt(index, contact);
  show("Contact successfully updated", context);
}

void handleDeleteContact(int index, BuildContext context) async {
  final Box box = Hive.box('contacts');
  await box.deleteAt(index);
  show("Contact deleted", context);
}
