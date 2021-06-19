import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Onbording%20Screen/views/onboarding_page.dart';
import 'package:mgxchange/Screens/Auth/login.dart';
import 'package:mgxchange/Screens/Auth/signup.dart';
import 'package:mgxchange/Screens/MainScreen/getloan.dart';
import 'package:mgxchange/Screens/MainScreen/home.dart';
import 'package:mgxchange/Screens/MainScreen/itemlist.dart';
import 'package:mgxchange/Screens/MainScreen/loan&sell.dart';
import 'package:mgxchange/Screens/MainScreen/profile.dart';
import 'package:mgxchange/Widget/sellitemdetails.dart';
import 'package:mgxchange/Screens/MainScreen/setprofilepic.dart';
import 'package:mgxchange/Screens/MainScreen/userdashboard.dart';
import 'package:mgxchange/Screens/ShowScreen/showsellcard.dart';
import 'package:mgxchange/Splash/Splashscreen.dart';

import 'Screens/MainScreen/sellproduct.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

BuildContext testContext;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mgxchange',
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: kPrimarycolor,
        ),
        backgroundColor: Colors.white,
        primaryColor: kPrimarycolor,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/Splashscreen',
      routes: <String, WidgetBuilder>{
        '/Splashscreen': (context) => SplashScreen(),
        '/onboarding_page': (context) => OnboardingPage(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/userdashboard': (context) => UserDashboard(),
        '/loan&sell': (context) => LoanSell(),
        '/getloan': (context) => GetLoan(),
        '/sellproduct': (context) => SellProduct(),
        '/profile': (context) => Profile(),
        '/setprofilepic': (context) => SetProfilePic(),
        '/itemlist': (context) => ItemList(),
        '/showsellcard': (context) => ShowSellCard(),
      },
    );
  }
}
