import 'dart:io';
import 'package:contacts/hive_functions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contacts/constants.dart';
import 'package:contacts/widgets/text_input_field.dart';

class AddContact extends StatefulWidget {
  final Function handleContact;
  AddContact({this.handleContact});
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  File image;
  final picker = ImagePicker();
  String name = "", phoneNumber = "";

  Future getImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage == null) {
        print("Please select an image");
      } else {
        image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await getImage();
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: image == null
                            ? AssetImage('images/bg.png')
                            : FileImage(image),
                      ),
                    ),
                    child: image == null
                        ? Center(
                            child: Text(
                            'Click here to add image',
                            textAlign: TextAlign.center,
                            style: mainTextStyle.copyWith(
                              color: bgColor,
                            ),
                          ))
                        : Container(),
                    height: 100,
                    width: 100,
                  ),
                ),
                image == null
                    ? Container()
                    : IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            image = null;
                          });
                        }),
                TextInputField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputField(
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                    onPressed: () {
                      if (name.length == 0 || phoneNumber.length == 0) {
                        show("Please enter valid name and phone number",
                            context);
                      } else {
                        widget.handleContact(name, phoneNumber, image, context);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add',
                      style: mainTextStyle.copyWith(
                        color: bgColor,
                      ),
                    ),
                    color: Colors.black)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
