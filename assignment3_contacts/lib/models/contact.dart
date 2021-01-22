import 'package:hive/hive.dart';
import 'dart:typed_data';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phoneNumber;

  @HiveField(2)
  Uint8List profileImage;

  Contact({this.name, this.phoneNumber, this.profileImage});
}
