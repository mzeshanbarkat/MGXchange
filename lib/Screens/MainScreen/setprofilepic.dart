import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Screens/MainScreen/profile.dart';

class SetProfilePic extends StatefulWidget {
  const SetProfilePic({Key key}) : super(key: key);

  @override
  _SetProfilePicState createState() => _SetProfilePicState();
}

class _SetProfilePicState extends State<SetProfilePic> {
  File _pickedImage;

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
        appBar: AppBar(
          elevation: 0,
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
          child: Stack(
            children: [
              Container(
                height: 200,
                color: kPrimarycolor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 30),
                            child: CircleAvatar(
                              radius: 71,
                              backgroundColor: kPrimarycolor,
                              child: CircleAvatar(
                                radius: 65,
                                backgroundColor: ColorsConsts.gradiendFEnd,
                                backgroundImage: _pickedImage == null
                                    ? null
                                    : FileImage(_pickedImage),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 120,
                              left: 110,
                              child: RawMaterialButton(
                                elevation: 10,
                                fillColor: kPrimarycolor,
                                child: Icon(Icons.add_a_photo,color: Colors.white,),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Choose option',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: ColorsConsts
                                                    .gradiendLStart),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                InkWell(
                                                  onTap: _pickImageCamera,
                                                  splashColor:
                                                      Colors.purpleAccent,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          Icons.camera,
                                                          color: kPrimarycolor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Camera',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: ColorsConsts
                                                                .title),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: _pickImageGallery,
                                                  splashColor:
                                                      Colors.purpleAccent,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          Icons.image,
                                                          color: Colors
                                                              .purpleAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: ColorsConsts
                                                                .title),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: _remove,
                                                  splashColor:
                                                      Colors.purpleAccent,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          Icons.remove_circle,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Remove',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                },
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return  Profile();
                        //     },
                        //   ),
                        //       (r) => true,
                        // );
                        Get.back();
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: 150,
                          height: 35,
                          decoration: BoxDecoration(
                            color: kPrimaryDark,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'Upload Profile Photo',
                              style: Textt1.textStyle(Colors.white, 15.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
