import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgxchange/Components/carddesign.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Screens/Auth/login.dart';
import 'package:mgxchange/Screens/MainScreen/itemlist.dart';
import 'package:mgxchange/Screens/MainScreen/profile.dart';

import 'loan&sell.dart';


class UserDashboard extends StatefulWidget {
  const UserDashboard({Key key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ScrollController _scrollController;
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
        title: Text(
          "User Dashboard",
          style: Textt2.textStyle(Colors.white, 22.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          controller: _scrollController,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                _fullname ?? "" ,
                style: Textt2.textStyle(Colors.white, 18.0),
              ),
              accountEmail: Text(
                _emailaddress ?? "",
                style: Textt1.textStyle(Colors.white, 15.0),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                backgroundImage: AssetImage('assets/zeshan1.jpg'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(LoanSell());
              },
              child: ListTile(
                title: Text(
                  'Loan - Sell Item',
                  style: Textt2.textStyle(FontColor, 15),
                ),
                leading: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowCircleUp,
                    ),
                    onPressed: () {}),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ItemList());
              },
              child: ListTile(
                title: Text(
                  'Track Item',
                  style: Textt2.textStyle(FontColor, 15),
                ),
                leading: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.searchengin,
                    ),
                    onPressed: () {}),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(Profile());
              },
              child: ListTile(
                title: Text(
                  'Profile',
                  style: Textt2.textStyle(FontColor, 15),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.person_outline,
                    ),
                    onPressed: () {}),
              ),
            ),
            GestureDetector(
              onTap: () {
              _Signout();
              },
              child: ListTile(
                title: Text(
                  'Logout',
                  style: Textt2.textStyle(FontColor, 15),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.logout,
                    ),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: 200,
                color: kPrimarycolor,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(LoanSell());
                              },
                              child: CarddDesign(
                                icn: FontAwesomeIcons.arrowCircleUp,
                                textt: "Loan / Sell Product",
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ItemList());
                              },
                              child: CarddDesign(
                                icn: FontAwesomeIcons.searchengin,
                                textt: "Track My Items",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(Profile());
                              },
                              child: CarddDesign(
                                icn: Icons.person_outline,
                                textt: "Profile",
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _Signout();
                              },
                              child: CarddDesign(
                                icn: Icons.logout,
                                textt: "Logout",
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _Signout() async {
    // Navigator.canPop(context)? Navigator.pop(context):null;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Image.network(
                    'https://image.flaticon.com/icons/png/128/1828/1828304.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sign out'),
                ),
              ],
            ),
            content: Text('Do you wanna Sign out?'),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    await _auth
                        .signOut()
                        .then((value) => Navigator.pop(context));

                    },
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

}
