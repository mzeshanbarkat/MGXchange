import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/raisedbutton.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Screens/MainScreen/setprofilepic.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _scrollController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _uid;
  String _fullname;
  String _emailaddress;

  void getData() async {
    User user = _auth.currentUser;
    _uid = user.email;

    print('user.displayName ${user.displayName}');
    // print('user.photoURL ${user.photoURL}');
    final DocumentSnapshot userDoc = user.isAnonymous
        ? null
        : await FirebaseFirestore.instance
            .collection("UserSignUpRecord")
            .doc(_uid)
            .get();
    if (userDoc == null) {
      return;
    } else {
      setState(() {
        _fullname = userDoc.get('FullName');
        _emailaddress = user.email;
      });
    }
    // print("name $_name");
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    getData();
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
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              height: 200,
              color: kPrimarycolor,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Center(
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 65.0,
                        backgroundImage: AssetImage('assets/zeshan1.jpg'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  _fullname ?? '',
                  style: Textt2.textStyle(kPrimaryDark, 25),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 2,
                  width: 110.0,
                  color: FontColor,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Email',
                  style: Textt2.textStyle(Colors.grey, 20),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  _emailaddress ?? '',
                  style: Textt2.textStyle(kPrimaryDark, 12),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SetProfilePic());
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
                          'Set Profile Photo',
                          style: Textt1.textStyle(Colors.white, 15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
