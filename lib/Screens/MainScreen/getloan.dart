import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/detailstextfield.dart';
import 'package:mgxchange/Components/postbutton.dart';
import 'package:mgxchange/Components/textfieldd.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Splash/productmessage.dart';

class GetLoan extends StatefulWidget {
  const GetLoan({Key key}) : super(key: key);

  @override
  _GetLoanState createState() => _GetLoanState();
}

class _GetLoanState extends State<GetLoan> {
  File _pickedImage;

  String _verticalGroupValue = "New";

  List<String> _status = ["New", 'Used'];

  Widget _displayChild1() {
    if (_pickedImage == null) {
      return new Icon(Icons.add, color: Colors.black);
    } else {
      return Image.file(
        _pickedImage,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      _pickedImage = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Upload Product',
          style: Textt2.textStyle(Colors.white, 20),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Get Loan',
              style: Textt2.textStyle(FontColor, 25),
            ),
            Text(
              'Upload Product Details',
              style: Textt1.textStyle(FontColor, 18),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailsTextField(
                    hinttextt: 'Item Type',
                    KeyboardType: TextInputType.text,
                  ),
                  DetailsTextField(
                    hinttextt: 'Required Loan Amount',
                    KeyboardType: TextInputType.text,
                  ),
                  DetailsTextField(
                    hinttextt: 'Phone Number',
                    KeyboardType: TextInputType.number,
                  ),
                  DetailsTextField(
                    hinttextt: 'Product Details',
                    KeyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Condition:',
                  style: Textt2.textStyle(FontColor, 18),
                ),
                RadioGroup<String>.builder(
                  direction: Axis.horizontal,
                  groupValue: _verticalGroupValue,
                  onChanged: (value) => setState(() {
                    _verticalGroupValue = value;
                  }),
                  items: _status,
                  itemBuilder: (item) => RadioButtonBuilder(
                    item,
                  ),
                  activeColor: kPrimarycolor,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffe2e9f2),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: OutlineButton(
                    onPressed: () {
                      ShowDalogue();
                    },
                    child: _displayChild1(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            PostButton(
              onchanged: () {
                Get.to(Productmessage());
              },
              textt: 'POST',
              textStyle: Textt1.textStyle(Colors.white, 18.0),
              colorr: kPrimarycolor,
            ),
          ],
        )),
      ),
    );
  }

  Widget ShowDalogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Choose option',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: kPrimarycolor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  InkWell(
                    onTap: _pickImageCamera,
                    splashColor: Colors.purpleAccent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: kPrimarycolor),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _pickImageGallery,
                    splashColor: Colors.purpleAccent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.image,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kPrimarycolor,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _remove,
                    splashColor: Colors.purpleAccent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'Remove',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
