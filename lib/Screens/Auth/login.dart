import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/textfieldd.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Screens/Auth/services/global_method.dart';
import 'package:mgxchange/Screens/Auth/signup.dart';
import 'package:mgxchange/Screens/MainScreen/userdashboard.dart';

import 'forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final _auth=  FirebaseAuth.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;



class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _globalMethods = GlobalMethods();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  // String _email = '';
  // String _password = '';
  bool _isLoading = false;
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  _login()async {
    // final isValid = _formKey.currentState.validate();
    // FocusScope.of(context).unfocus();
    // if (isValid) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   _formKey.currentState.save();
      try {
        await _auth
            .signInWithEmailAndPassword(
            email: _email.text.toLowerCase().trim(),
            password: _password.text.trim())
        .then((value) =>
        Navigator.canPop(context) ? Navigator.pop(context) : null);

         {
          Get.to(UserDashboard());


          Get.snackbar(
            "Welcome to Dashboard", // title
            "You have Login Succesfully", // message
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
  // }
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: (){Get.to(ForgotPassword());
                            },
                            child: Text('Forgot Password?',style: Textt2.textStyle(FontColor, 15.0),)),
                      ],
                    )

                  ],
                ),
              ),
              _isLoading
              ? CircularProgressIndicator()
              :AuthButton(
                onchanged: (){
                  _login();
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
