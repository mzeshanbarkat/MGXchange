import 'package:flutter/material.dart';
import 'package:mgxchange/Data/Constant.dart';


class CarddDesign extends StatelessWidget {
  final  icn;
  final String textt;
  CarddDesign({Key key, this.icn, this.textt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      elevation: 4,
      color: Colors.white,
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(icn,size: 30,color: kPrimarycolor,),
            SizedBox(
              height: 15,
            ),
            FittedBox(
                child: Text(textt,style: Textt2.textStyle(FontColor, 15.0),),
            )
          ],
        ),
      ),
    );
  }
}
