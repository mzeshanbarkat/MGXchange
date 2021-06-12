import 'package:flutter/material.dart';
import 'package:mgxchange/Screens/MainScreen/loan&sell.dart';
import 'package:mgxchange/Screens/MainScreen/sellproduct.dart';
import 'package:mgxchange/Screens/MainScreen/userdashboard.dart';

class Productmessage extends StatefulWidget {
  const Productmessage({Key key}) : super(key: key);

  @override
  _ProductmessageState createState() => _ProductmessageState();
}

class _ProductmessageState extends State<Productmessage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds:2),(){
      print("After 2 seconds");

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return  UserDashboard();
          },
        ),
            (r) => false,
      );

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserDashboard()));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/uploadproduct.jpg"),
              fit: BoxFit.fill,)
        ),

      ),
    );
  }
}
