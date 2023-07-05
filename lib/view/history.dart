import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view/history_buy.dart';
import 'package:lottery/view/history_win.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: TabBar(
            // unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            tabs: [
              Tab(
                child: Text(
                  'ประวัติการซื้อ',
                ),
              ),
              Tab(
                child: Text('ประวัติการถูก'),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [HistoryBuy(), HistoryWin()],
        ),
      ),
    );
  }
}
