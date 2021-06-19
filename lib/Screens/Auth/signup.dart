import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/textfieldd.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Screens/Auth/login.dart';
import 'package:mgxchange/Screens/Auth/services/global_method.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
final FocusNode _passwordFocusNode = FocusNode();
final FocusNode _emailFocusNode = FocusNode();

final TextEditingController _name = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final _auth = FirebaseAuth.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  GlobalMethods _globalMethods = GlobalMethods();
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }


  _signup() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      try {
        final user = await _auth
            .createUserWithEmailAndPassword(
              email: _email.text.toLowerCase().trim(),
              password: _password.text.trim(),
            )
            .then(
              (currentUser) => FirebaseFirestore.instance
                  .collection("UserSignUpRecord")
                  .doc(currentUser.user.email)
                  .set({
                "uid": currentUser.user.uid,
                "FullName": _name.text,
                "email": _email.text,
                "password": _password.text,
              }).then((result) => {
                        _name.clear(),
                        _email.clear(),
                        _password.clear(),
                      }),
            );
        if (user != null) {
          Get.to(Login());

          Get.snackbar(
            "Welcome", // title
            "Signup Sucessfully", // message
            shouldIconPulse: true,
            // onTap:(){},
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 4),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.grey[900],
          );
        }
      } catch (error) {
        _globalMethods.authErrorHandle(error.message, context);
        print('error occured ${error.message}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: Text(
                    'Create Your Account',
                    style: Textt2.textStyle(FontColor, 25),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 330.0,
                height: 260.0,
                // color: Colors.brown,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFieldd(
                        key: ValueKey('Name'),
                        Validator: (value) {
                          if (value.isEmpty) {
                            return 'name cannot be null';
                          }
                          return null;
                        },
                        controller: _name,
                        hinttextt: 'Full Name',
                        obscre: false,
                      ),
                      TextFieldd(
                        key: ValueKey('email'),
                        Validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        controller: _email,
                        hinttextt: 'mian@gmail.com',
                        obscre: false,
                      ),
                      TextFieldd(
                        key: ValueKey('Password'),
                        Validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Please enter a valid Password';
                          }
                          return null;
                        },
                        controller: _password,
                        hinttextt: 'Enter your Password',
                        obscre: _obscureText,
                        iconn: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _isLoading
              ? CircularProgressIndicator()
              :AuthButton(
                onchanged: () {
                  _signup();
                },
                textt: 'Signup',
                textStyle: Textt1.textStyle(Colors.white, 18.0),
                colorr: kPrimaryDark,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  'Already have an account?',
                  style: Textt2.textStyle(FontColor, 14),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Login Now',
                      style: Textt2.textStyle(kPrimarycolor, 18),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.0,
                        color: kPrimarycolor,
                      ),
                      onPressed: () {
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
