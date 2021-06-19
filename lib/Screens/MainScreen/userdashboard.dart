import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgxchange/Components/carddesign.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Screens/MainScreen/itemlist.dart';
import 'package:mgxchange/Screens/MainScreen/profile.dart';

import 'loan&sell.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({Key key}) : super(key: key);

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
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Mian Zeshan",
                style: Textt2.textStyle(Colors.white, 18.0),
              ),
              accountEmail: Text(
                "zee@gmail.com",
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
                Get.to(LoanSell());
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
                              onTap: () {},
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
}
