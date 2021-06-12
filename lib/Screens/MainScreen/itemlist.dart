import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mgxchange/Data/Constant.dart';
import 'package:get/get.dart';
import 'package:mgxchange/Screens/ShowScreen/showloancard.dart';
import 'package:mgxchange/Screens/ShowScreen/showsellcard.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(
      text: 'SELL',
    ),

    // second tab [you can add an icon using the icon property]
    Tab(
      text: 'LOAN',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: list.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Item List',
            style: Textt2.textStyle(Colors.white, 20),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    border: Border.all(
                      color: kPrimaryDark,
                    )),
                child: new TabBar(
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BubbleTabIndicator(
                      indicatorHeight: 40.0,
                      indicatorColor: kPrimarycolor,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      // Other flags
                      // indicatorRadius: 1,
                      // insets: EdgeInsets.all(1),
                      // padding: EdgeInsets.all(10)
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: kPrimarycolor,
                    indicatorColor: Colors.grey,
                    tabs: list),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ShowSellCard(),
                  ShowLoanCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
