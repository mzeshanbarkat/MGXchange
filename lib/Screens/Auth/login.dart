import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/textfieldd.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Screens/Auth/signup.dart';
import 'package:mgxchange/Screens/MainScreen/userdashboard.dart';

class Login extends StatelessWidget {

  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 100,
                      color: kPrimarycolor,
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/logo1.png'),
                          fit: BoxFit.contain,
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text('Login Screen',style: Textt2.textStyle(FontColor, 25),),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: 330.0,
                height: 200.0,
                // color: Colors.brown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldd(hinttextt: 'mian@gmail.com',
                      obscre: false,
                    ),
                    TextFieldd(hinttextt: 'Enter your Password',
                      obscre: true,
                      iconn: Icon(Icons.remove_red_eye),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password?',style: Textt2.textStyle(FontColor, 15.0),),
                      ],
                    )

                  ],
                ),
              ),

              AuthButton(
                onchanged: (){
                  Get.to(UserDashboard());
                },
                textt: 'LOGIN',
                textStyle: Textt1.textStyle(Colors.white, 18.0),
                colorr: kPrimaryDark,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text('No account yet?',style: Textt2.textStyle(FontColor, 18),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Sign up Now',style: Textt2.textStyle(kPrimarycolor, 18),),
                  ),
                  IconButton(icon: Icon(Icons.arrow_forward_ios,size: 15.0,color: kPrimarycolor,), onPressed: (){
                    Get.to(SignUp());
                  })

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

