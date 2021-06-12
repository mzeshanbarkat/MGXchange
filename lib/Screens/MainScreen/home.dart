import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Components/raisedbutton.dart';
import 'package:mgxchange/Screens/Auth/login.dart';
import 'package:mgxchange/Screens/Auth/signup.dart';

class Home extends StatefulWidget {
  static String id = 'home';

  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200.0,
                // color: Colors.brown,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    padding: EdgeInsets.only(right: 85.0),
                    height: 60,
                    width: 250.0,
                    // color: Colors.red,
                    child: Image(
                      image: AssetImage('assets/logo3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                      Text('Hello Again!',style: Textt2.textStyle(FontColor, 30.0),),
                      Text('Welcome',style: Textt2.textStyle(FontColor, 30.0),),
                      Text('Back',style: Textt2.textStyle(FontColor, 30.0),),
                      Text('EXCHANGE IT TO CASH',style: Textt1.textStyle(FontColor, 12.0),),

                    ]),
              ),

              Padding(
                padding: EdgeInsets.only(top: 200.0,),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedBtn(colorr: kPrimarycolor,
                        textt: 'LOGIN',
                        textStyle: Textt1.textStyle(Colors.white, 15.0),
                        onchanged: (){
                        Get.to(Login());
                        },
                      ),
                      RaisedBtn(colorr: kPrimarycolor,
                        textt: 'SIGNUP',
                        textStyle: Textt1.textStyle(Colors.white, 15.0),
                        onchanged: (){
                          Get.to(SignUp());

                        },
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
