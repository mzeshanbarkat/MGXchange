import 'package:flutter/material.dart';
import 'package:mgxchange/Utilis/loancardlist.dart';
import 'package:mgxchange/Widget/loancardwidget.dart';


class ShowLoanCard extends StatefulWidget {
  const ShowLoanCard({Key key}) : super(key: key);

  @override
  _ShowLoanCardState createState() => _ShowLoanCardState();
}

class _ShowLoanCardState extends State<ShowLoanCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: LoanCardList.list.length,
          itemBuilder: (BuildContext context, int index )
          => buildloancard(context,index)
      ),

    );
  }
}
