import 'package:flutter/material.dart';
import 'package:mgxchange/Onbording%20Screen/views/onboarding_page.dart';
import 'package:mgxchange/Screens/Auth/login.dart';
import 'package:mgxchange/Screens/MainScreen/home.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds:3),(){
      print("After 3 seconds");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnboardingPage()));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/splash.jpg"),
              fit: BoxFit.fill,)
        ),

      ),
    );
  }
}