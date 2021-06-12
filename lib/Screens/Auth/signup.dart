import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/textfieldd.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Screens/Auth/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  child: Text('Create Your Account',style: Textt2.textStyle(FontColor, 25),),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: 330.0,
                height: 230.0,
                // color: Colors.brown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldd(hinttextt: 'User Name',
                      obscre: false,
                    ),
                    TextFieldd(hinttextt: 'mian@gmail.com',
                      obscre: false,
                    ),
                    TextFieldd(hinttextt: 'Enter your Password',
                      obscre: true,
                      iconn: Icon(Icons.remove_red_eye),
                    ),


                  ],
                ),
              ),

              AuthButton(
                onchanged: (){
                  Get.to(Login());
                },
                textt: 'Signup',
                textStyle: Textt1.textStyle(Colors.white, 18.0),
                colorr: kPrimaryDark,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text('Already have an account?',style: Textt2.textStyle(FontColor, 14),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Login Now',style: Textt2.textStyle(kPrimarycolor, 18),),
                  ),
                  IconButton(icon: Icon(Icons.arrow_forward_ios,size: 15.0,color: kPrimarycolor,), onPressed: (){
                    Get.to(Login());
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
