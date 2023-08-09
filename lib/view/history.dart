import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view/history_buy.dart';
import 'package:lottery/view/history_win.dart';
import 'package:lottery/view_models/history_view_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryViewModel _historyViewModel = Get.put(HistoryViewModel());

  @override
  void initState() {
    if (_historyViewModel.listOfMonth.length == 0) {
      _historyViewModel.getHistory();
    }
    super.initState();
  }

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
          children: [
            HistoryBuy(
              listOfMonth: _historyViewModel.listOfMonth,
              onChange: (value) {
                print('value list 67: ${value!.values.first}');
                final collectionList = value.values.first;
                _historyViewModel.getInvoice(collectionList);
              },
              invoiceList: _historyViewModel.selectedMonth,
              // changeMonth: _historyViewModel.getInvoice(),
            ),
            HistoryWin(),
          ],
        ),
      ),
    );
  }
}
