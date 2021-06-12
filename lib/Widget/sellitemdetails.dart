import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:mgxchange/Utilis/sellcardlist.dart';

class SellitemDetails extends StatefulWidget {
  final String img;
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;

  const SellitemDetails(
      {Key key, this.img, this.txt1, this.txt2, this.txt3, this.txt4})
      : super(key: key);

  @override
  _SellitemDetailsState createState() => _SellitemDetailsState();
}

class _SellitemDetailsState extends State<SellitemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Detail',
          style: Textt1.textStyle(Colors.white, 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  child: Image.asset(widget.img),
                ),
              ),
              Text(
                widget.txt1,
                style: Textt2.textStyle(FontColor, 18),
              ),
              Text(
                widget.txt2,
                style: Textt1.textStyle(Colors.deepOrangeAccent, 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(widget.txt3),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.phone_android),
                  Text(widget.txt4),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
