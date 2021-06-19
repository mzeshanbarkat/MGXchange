import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Data/Constant.dart';

import 'login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String _email;

  _passwordReset() async {
    try {
      _formKey.currentState.save();
      final user = await _auth.sendPasswordResetEmail(email: _email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter  Your Email',
                style: TextStyle(fontSize: 30, color: FontColor),
              ),
              TextFormField(
                onSaved: (newEmail) {
                  _email = newEmail;
                },
                // style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Textt2.textStyle(FontColor, 18),
                  // icon: Icon(
                  //   Icons.mail,
                  // ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryDark),
                  ),
                ),
              ),
              SizedBox(height: 30),
              AuthButton(
                onchanged: (){
                  _passwordReset();
                  print(_email);

                  Get.offAll(Login());
                  Get.snackbar(
                    "Email Sent Successfully", // title
                    "An email has just been sent to you, Click the link provided to complete password reset",
                    // message
                    shouldIconPulse: true,
                    // onTap:(){},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 4),
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.grey[900],
                  );


                },
                textt: 'Send Email',
                textStyle: Textt1.textStyle(Colors.white, 18.0),
                colorr: kPrimaryDark,
              ),
              // RaisedButton(
              //   child: Text('Send Email'),
              //   color: kPrimaryDark,
              //   onPressed: () {
              //     _passwordReset();
              //     print(_email);
              //
              //     Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //         builder: (BuildContext context) {
              //           return Login();
              //         },
              //       ),
              //       (r) => false,
              //     );
              //
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
