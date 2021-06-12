import 'package:flutter/material.dart';
import 'package:mgxchange/Data/Constant.dart';

class DetailsTextField extends StatelessWidget {
  final String hinttextt;
  final KeyboardType;
  final controller;
  const DetailsTextField({Key key, this.hinttextt, this.KeyboardType,this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Color(0xffe2e9f2),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Color(0xffe2e9f2),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: KeyboardType,
        decoration: InputDecoration(
          hintText: hinttextt,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryDark),
          ),
        ),
      ),
    );
  }
}
