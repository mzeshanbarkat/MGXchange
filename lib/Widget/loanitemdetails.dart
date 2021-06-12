import 'package:flutter/material.dart';
import 'package:mgxchange/Data/Constant.dart';

class LoanitemDetails extends StatefulWidget {
  final String img;
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;

  const LoanitemDetails(
      {Key key, this.img, this.txt1, this.txt2, this.txt3, this.txt4})
      : super(key: key);

  @override
  _LoanitemDetailsState createState() => _LoanitemDetailsState();
}

class _LoanitemDetailsState extends State<LoanitemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Item Detail',
          style: Textt1.textStyle(Colors.white, 20),
        ),
      ),
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
