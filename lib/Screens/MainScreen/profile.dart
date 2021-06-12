import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mgxchange/Components/authbutton.dart';
import 'package:mgxchange/Components/raisedbutton.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Screens/MainScreen/setprofilepic.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
          Get.back();
        }),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              color: kPrimarycolor,

            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Center(
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 65.0,
                        backgroundImage: AssetImage('assets/zeshan1.jpg'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Text('Mian Zeshan',style: Textt2.textStyle(kPrimaryDark, 25),),
                SizedBox(height: 10.0,),
                Container(
                  height: 2,
                  width: 110.0,
                  color: FontColor,
                ),
                SizedBox(height: 10.0,),
                Text('Email',style: Textt2.textStyle(Colors.grey, 15),),
                SizedBox(height: 8.0,),
                Text('zeee@gmail.com',style: Textt2.textStyle(FontColor, 20),),
                SizedBox(height: 30.0,),

                GestureDetector(
                  onTap: (){
                    Get.to(SetProfilePic());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                     width: 150,
                     height: 35,
                      decoration: BoxDecoration(
                        color: kPrimaryDark,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(child: Text('Set Profile Photo',style: Textt1.textStyle(Colors.white, 15.0),),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
