import 'package:contacts/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contacts/constants.dart';
import 'dart:io';

class UpdateContact extends StatefulWidget {
  final name, phoneNumber, image, index, handleUpdate, contactContext;
  UpdateContact(
      {this.name,
      this.phoneNumber,
      this.image,
      this.index,
      this.handleUpdate,
      this.contactContext});
  @override
  _UpdateContactState createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  File image;
  final picker = ImagePicker();
  String name, phoneNumber;
  var newImage;
  Color bColor = bgColor;

  Future getImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage == null) {
        print("Please select an image");
      } else {
        image = File(pickedImage.path);
        newImage = image;
      }
    });
  }

  @override
  void initState() {
    name = widget.name;
    phoneNumber = widget.phoneNumber;
    newImage = widget.image;
    super.initState();
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
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: image == null
                            ? newImage == null
                                ? AssetImage('images/contact.png')
                                : MemoryImage(newImage)
                            : FileImage(image),
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              image = null;
                              newImage = null;
                              bColor = Colors.black;
                            });
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () async {
                            await getImage();
                          })
                    ],
                  ),
                  TextInputField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    initialValue: name,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextInputField(
                    onChanged: (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    },
                    initialValue: phoneNumber,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    color: Colors.black,
                    onPressed: () {
                      widget.handleUpdate(widget.index, name, phoneNumber,
                          image, widget.contactContext);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Update",
                      style: mainTextStyle.copyWith(
                        color: bgColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
