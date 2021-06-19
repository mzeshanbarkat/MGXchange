import 'package:flutter/material.dart';
import 'package:mgxchange/Data/Constant.dart';

class TextFieldd extends StatelessWidget {
  final iconn;
  final String hinttextt;
  final key;
  final Validator;
  final controller;

  final onSaved;

  bool obscre;

  TextFieldd(
      {@required this.iconn,
      this.hinttextt,
      this.obscre,
      this.key,
      this.Validator,
      this.controller,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      onSaved: onSaved,
      validator: Validator,
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
