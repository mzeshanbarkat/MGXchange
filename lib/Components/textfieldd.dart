import 'package:flutter/material.dart';
import 'package:mgxchange/Data/Constant.dart';


class TextFieldd extends StatelessWidget {
  final iconn;
  final String hinttextt;
  bool obscre;
  TextFieldd({@required this.iconn,this.hinttextt,this.obscre,});
  @override
  Widget build(BuildContext context) {
    return TextField(

      obscureText: obscre,
      decoration: InputDecoration(
          hintText: hinttextt,
          suffixIcon: iconn,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryDark),
          ),

      ),
    );
  }
}
